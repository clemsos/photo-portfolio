<?php

	class extension_uniqueuploadfield extends Extension {

		public function about() {
			return array(
				'name'			=> 'Field: Unique File Upload',
				'version'		=> '1.3',
				'release-date'	=> '2011-02-10',
				'author'		=> array(
					'name'			=> 'Michael Eichelsdoerfer',
					'website'		=> 'http://www.michael-eichelsdoerfer.de',
					'email'			=> 'info@michael-eichelsdoerfer.de'
				),
				'description'	=> 'Upload files with unique names, using the UNIX timestamp.'
			);
		}

		public function update($previousVersion)
		{
			$symphony_version = Symphony::Configuration()->get('version', 'symphony');
			if(version_compare($symphony_version, '2.0.8RC3', '>=') && version_compare($previousVersion, '1.1', '<'))
			{
				$uniqueupload_entry_tables = Symphony::Database()->fetchCol("field_id", "SELECT `field_id` FROM `tbl_fields_uniqueupload`");
				if(is_array($uniqueupload_entry_tables) && !empty($uniqueupload_entry_tables))
				{
					foreach($uniqueupload_entry_tables as $field)
					{
						Symphony::Database()->query(sprintf(
							"ALTER TABLE `tbl_entries_data_%d` CHANGE `size` `size` INT(11) UNSIGNED NULL DEFAULT NULL",
							$field
						));
					}
				}
			}
		}

		public function uninstall() {
			Symphony::Database()->query("DROP TABLE `tbl_fields_uniqueupload`");
		}

		public function install() {
			return Symphony::Database()->query(
				"CREATE TABLE `tbl_fields_uniqueupload` (
				 `id` int(11) unsigned NOT NULL auto_increment,
				 `field_id` int(11) unsigned NOT NULL,
				 `destination` varchar(255) NOT NULL,
				 `validator` varchar(50),
				  PRIMARY KEY (`id`),
				  KEY `field_id` (`field_id`)
				) ENGINE=MyISAM;"
			);
		}

	}
