public with sharing class MyFirstClass {
    public MyFirstClass() {
        System.debug('varName >>');
        Integer i;
        Account acc = [SELECT ID, Name FROM Account LIMIT 1];
        System.debug(acc);
    }
}