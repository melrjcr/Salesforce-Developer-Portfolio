@isTest
private class AccountTriggerHandlerTest {

    @isTest
    static void testInsertVIPAccount() {
        //Create a high-revenue account
        Account highRev = new Account(Name='New VIP', AnnualRevenue=2000000);
        Account lowRev = new Account(Name='Regular Joe', AnnualRevenue=100);

        // 2. EXECUTE
        Test.startTest();
        insert new List<Account>{highRev, lowRev};
        Test.stopTest();

        // 3. VERIFY
        Account resultVIP = [SELECT Description FROM Account WHERE Name='New VIP'];
        Account resultReg = [SELECT Description FROM Account WHERE Name='Regular Joe'];

        System.assertEquals('Priority Account: High Revenue Customer', resultVIP.Description, 'VIP should be flagged on insert');
        System.assertEquals(null, resultReg.Description, 'Regular account should NOT be flagged');
    }

    @isTest
    static void testUpdateToVIP() {
        // 1. SETUP: Start with a low-revenue account
        Account acc = new Account(Name='Growing Biz', AnnualRevenue=500000);
        insert acc;

        // 2. EXECUTE: Update revenue to cross the 1M threshold
        acc.AnnualRevenue = 1500000;
        
        Test.startTest();
        update acc;
        Test.stopTest();

        // 3. VERIFY
        Account result = [SELECT Description FROM Account WHERE Id = :acc.Id];
        System.assertEquals('Priority Account: High Revenue Customer', result.Description, 'Should update description when revenue increases');
    }
        @isTest
    static void testBulkInsert() {
    List<Account> bulkAccts = new List<Account>();
    for(Integer i=0; i<200; i++) {
        // Half get high revenue, half get low
        Integer rev = (i < 100) ? 2000000 : 500;
        bulkAccts.add(new Account(Name='Bulk '+i, AnnualRevenue=rev));
        }   

        Test.startTest();
        insert bulkAccts;
        Test.stopTest();

        // Verify a sample from the high-revenue group
        Account highRevSample = [SELECT Description FROM Account WHERE Name='Bulk 50'];
        System.assertEquals('Priority Account: High Revenue Customer', highRevSample.Description);
    }
}