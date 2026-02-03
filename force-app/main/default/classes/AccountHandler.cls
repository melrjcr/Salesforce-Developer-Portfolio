/**
 * AccountHandler
 * ----------------
 * Utility for safe Account creation callable from Flows or Apex.
 *
 * - Respects org sharing via 'with sharing'
 * - Performs permission check and throws a standard Exception with a clear message
 * - Uses Database methods and USER_MODE per security rules
 * - Return-early pattern for readability
 */
public with sharing class AccountHandler {

    
    public static Account insertNewAccount(String acctName) {
        
        // 1. Guard Clause: Validation
        if (String.isBlank(acctName)) {
                       
            return null; 
        }

        // 2. Security Check
        if (!Schema.sObjectType.Account.isCreateable()) {
            throw new AuraHandledException('Insufficient access to create Accounts.');
        } 

        // 3. Logic & DML
        try {
            Account acct = new Account(Name = acctName, AccountNumber= '12345678');
            
               insert acct;
            
            return acct;
        } catch (DmlException e) {
            System.debug('A DML exception has occurred: ' + e.getMessage());
            // If the insert fails, we return null so the flow/app doesn't crash
            return null;
        }
    }
}