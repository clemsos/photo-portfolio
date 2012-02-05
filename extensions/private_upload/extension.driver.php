<?php

Class extension_private_upload extends Extension
{

    /**
     * About
     * @return array    Information
     */
    public function about()
    {
        return array(
            'name' => 'Field: Private Upload Field',
            'version' => '1.0',
            'release-date' => '2011-04-29',
            'author' => array(
                'name' => 'Giel Berkers',
                'website' => 'http://www.gielberkers.com',
                'email' => 'info@gielberkers.com'
            )
        );
    }

    /**
     * De-Installation
     * @return void
     */
    public function uninstall()
    {
        Symphony::Database()->query('DROP TABLE `tbl_fields_private_upload`;');
    }

    /**
     * Installation
     * @return void
     */
    public function install()
    {
        Symphony::Database()->query('
            CREATE TABLE IF NOT EXISTS `tbl_fields_private_upload` (
              `id` int(11) unsigned NOT NULL auto_increment,
              `field_id` int(11) unsigned NOT NULL,
              `destination` varchar(255) collate utf8_unicode_ci default NULL,
              `validator` varchar(255) collate utf8_unicode_ci default NULL,
              PRIMARY KEY  (`id`),
              KEY `field_id` (`field_id`)
            );
        ');
    }
}