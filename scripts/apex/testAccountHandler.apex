Account myAcct = AccountHandler.insertNewAccount('GemLogis');
if(myAcct != null) {
    System.debug('Success! Account ID: ' + myAcct.Id);
} else {
    System.debug('Failed to create account.');
}