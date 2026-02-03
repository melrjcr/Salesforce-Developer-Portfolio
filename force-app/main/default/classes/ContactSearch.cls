public with sharing class ContactSearch {

    /**
     * @description Search contacts by last name and mailing postal code with CRUD/FLS validation.
     * @param para1 - LastName LIKE pattern (e.g., 'Smi%')
     * @param para2 - MailingPostalCode LIKE pattern (e.g., '94%')
     * @return List of Contact records the caller has access to view
     */
    @AuraEnabled
    public static List<Contact> searchForContacts(String para1, String para2) {
        // Return early if no search criteria provided
        if (String.isBlank(para1) && String.isBlank(para2)) {
            return new List<Contact>();
        }

        // Check object- and field-level permissions before performing SOQL
        Schema.DescribeSObjectResult contactDescribe = Contact.SObjectType.getDescribe();
        if (!contactDescribe.isAccessible()) {
            return new List<Contact>();
        }

         // Execute SOQL with security enforced to respect sharing and FLS at runtime
        List<Contact> contacts = [
            SELECT Id, Name
            FROM Contact
            WHERE LastName LIKE :para1
            AND MailingPostalCode LIKE :para2
            WITH SECURITY_ENFORCED
        ];
        return contacts;
    }
}