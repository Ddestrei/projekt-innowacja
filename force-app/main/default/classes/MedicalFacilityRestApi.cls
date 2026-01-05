@RestResource(urlMapping='/MedicalFacilities')
global with sharing class MedicalFacilityRestApi {

    @HttpGet
    global static List<Medical_Facility__c> getMedicalFacilities() {
        return [
            SELECT Id, Name, City__c, Phone__c, Postal_Code__c, Street_Address__c, Type__c
            FROM Medical_Facility__c
        ];
    }
}