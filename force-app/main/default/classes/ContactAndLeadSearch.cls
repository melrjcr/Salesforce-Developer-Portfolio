public with sharing class ContactAndLeadSearch {
    public static SObject searchContactsAndLeads(string para1) {
        if((para1 = null) || (para1 = '')) {
            return null;
        }
        List<Contact> contacts = [
            SELECT Id, Name
            FROM Contact
            WHERE LastName LIKE :para1
            WITH SECURITY_ENFORCED
        ];
        List<Lead> leads = [
            SELECT Id, Name
            FROM Lead 
            WHERE LastName LIKE :para1
            WITH SECURITY_ENFORCED
        ];
        List< List< sObject> > results = new List< List< sObject> >();
        results.add(contacts);
        results.add(leads);

        return results;

    }
}