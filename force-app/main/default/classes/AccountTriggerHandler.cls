public with sharing class AccountTriggerHandler {

    public static void handleAccountAutomation(List<Account> newAccounts, Map<Id, Account> oldMap) {
        for (Account acc : newAccounts) {
            
          
            Boolean isNew = (oldMap == null);
            Boolean revenueChanged = false;

            if (isNew) {
                revenueChanged = (acc.AnnualRevenue > 1000000);
            } else {
                
                Account oldAcc = oldMap.get(acc.Id);
                revenueChanged = (acc.AnnualRevenue > 1000000 && oldAcc.AnnualRevenue <= 1000000);
            }

            if (revenueChanged) {
                acc.Description = 'Priority Account: High Revenue Customer';
            }
        }
    }
}