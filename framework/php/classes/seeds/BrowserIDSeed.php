<?php
/**
 * BrowserID Seed http://browserid.org
 *
 * @package diy.org.cashmusic
 * @author CASH Music
 * @link http://cashmusic.org/
 *
 * Copyright (c) 2011, CASH Music
 * Licensed under the Affero General Public License version 3.
 * See http://www.gnu.org/licenses/agpl-3.0.html
 *
 **/
class BrowserIDSeed extends SeedBase {
	public function __construct($key) {
		$this->settings_type = 'com.browserid';
		$this->connectDB();
		$this->getCASHSettings();
	}

	// Borrowed from OpenPhoto, copyright Jaesen Mathai
	// http://openphoto.me
	public static function login($assertion, $audience)
	{
		$ch = curl_init('https://browserid.org/verify');
		$params = array('assertion' => $assertion, 'audience' => $audience);
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($params));
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_CAINFO, getConfig()->get('paths')->configs.'/ca-bundle.crt');
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);

		$response = curl_exec($ch);
		$response = json_decode($response, 1);
		if(!isset($response['status']) || $response['status'] != 'okay')
			return false;

		return true;
	}

} // END class
?>
