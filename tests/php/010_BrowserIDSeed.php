<?php

/**
 * BrowserID Seed Tests http://browserid.org
 *
 * @package diy.org.cashmusic
 * @author CASH Music
 * @link http://cashmusic.org/
 *
 * Copyright (c) 2011, CASH Music
 * Licensed under the Affero General Public License version 3.
 * See http://www.gnu.org/licenses/agpl-3.0.html
 * vim: noexpantab
 **/

require_once('tests/php/base.php');

class BrowserIDSeedTests extends UnitTestCase {
	function testBrowserIDSeed(){
		$id = new BrowserIDSeed();
		$this->assertIsa($id, 'BrowserIDSeed');
		$rc = $id->login($assertion=1, $audience=1);
		$this->assertFalse($rc, "invalid assertion returns false");
	}
}
?>
