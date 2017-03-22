@IsTest
private class LoginFormServiceTest {

    static testMethod void testService() {
        LoginFormService.load();
        LoginFormService.login('','');
    }
}