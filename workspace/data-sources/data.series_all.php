<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceseries_all extends Datasource{

		public $dsParamROOTELEMENT = 'series-all';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '2';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'5' => '{$serie-title}',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination',
				'title',
				'description: formatted',
				'pictures',
				'order',
				'menu-top'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Series: all',
				'author' => array(
					'name' => 'Clement Renaud',
					'website' => 'http://www.zozoqu.com',
					'email' => 'clement.renaud@gmail.com'),
				'version' => '1.0',
				'release-date' => '2011-09-06T04:44:35+00:00'
			);
		}

		public function getSource(){
			return '2';
		}

		public function allowEditorToParse(){
			return true;
		}

		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			

			return $result;
		}

	}
