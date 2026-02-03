public with sharing class StringListTest {
    public generateStringList(Integer number) {
        List<String> ReturnList = new List<String>();
        for(Integer i = 0; i < number; i++) {
            ReturnList.add('Test ' + TEXT(i));
            }

        return ReturnList;

    }
}