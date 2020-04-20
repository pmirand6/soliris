<?php

class FirstCest
{
    public function _before(AcceptanceTester $I)
    {
    }

    // tests
    public function tryToTest(AcceptanceTester $I)
    {
    }

    public function loginpageFails(AcceptanceTester $I)
    {
        $I->amOnPage('/');
        $I->see('Ingresar');
        $I->fillField('#inputUser','test');
        $I->fillField('#inputPassword','test');
        $I->click("button");
        $I->seeInPopup('Verifique el usuario y la contraseña introducidos');
    }

    public function loginpageSuccess(AcceptanceTester $I)
    {
        $I->amOnPage('/');
        $I->see('Ingresar');
        $I->fillField('#inputUser','pmiranda');
        $I->fillField('#inputPassword','nanu2912');
        $I->click("button");
        $I->amOnPage('/defa.php');
    }
}
