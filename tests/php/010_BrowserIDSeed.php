<?php

require_once('tests/php/base.php');

class BrowserIDSeedTests extends UnitTestCase {
	function testBrowserIDSeed(){
		$id = new BrowserIDSeed($assertion=1,$audience=1);
		$this->assertIsa($id, 'BrowserIDSeed');
	}
}
?>
