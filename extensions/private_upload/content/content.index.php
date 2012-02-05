<?php
require_once(TOOLKIT . '/class.administrationpage.php');

class contentExtensionPrivate_uploadIndex extends AdministrationPage
{
    public function __construct(&$parent)
    {
        parent::__construct($parent);
    }

    public function build() {
        parent::build();
    }

    public function view() {

        // If you wish to write a custom event to access these files on the frontend, you can use some of this code
        // in your event, but you would still have to check with PHP-code if the user is logged in or not.

        if (file_exists($_GET['file'])) {
            header('Content-Description: File Transfer');
            header('Content-Disposition: attachment; filename='.basename($_GET['file']));
            header('Content-Transfer-Encoding: binary');
            header('Expires: 0');
            header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
            header('Pragma: public');
            header('Content-Length: ' . filesize($_GET['file']));
            ob_clean();
            flush();
            readfile($_GET['file']);
            exit;
        } else {
            die('File does not exist!');
        }
    }
}