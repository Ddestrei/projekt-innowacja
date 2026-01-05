public with sharing class MedicalFacilitySyncService {

    public static void sync() {
        List<Medical_Facility__c> facilities =
            MedicalFacilityApiService.fetchFacilities();

        Map<String, Medical_Facility__c> existing = new Map<String, Medical_Facility__c>(
            [SELECT Id, Name
             FROM Medical_Facility__c
             WHERE Id IN :facilities]
        );

        List<Medical_Facility__c> toUpsert = new List<Medical_Facility__c>();

        for (Medical_Facility__c dto : facilities) {
            Medical_Facility__c facility =
                existing.get(dto.Id);

            if (facility == null) {
                facility = new Medical_Facility__c();
                facility.Id = dto.Id;
            }

            facility.Name = dto.Name;
            facility.Street_Address__c = dto.Street_Address__c;
            facility.City__c = dto.City__c;

            toUpsert.add(facility);
        }

        upsert toUpsert Id;
    }
}