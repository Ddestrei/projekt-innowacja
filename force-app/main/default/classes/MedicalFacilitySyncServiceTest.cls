@IsTest
private class MedicalFacilitySyncServiceTest {

    @IsTest
    static void shouldSyncFacilities() {

        Test.setMock(HttpCalloutMock.class, new MedicalFacilityMock());

        Test.startTest();
        MedicalFacilitySyncService.sync();
        Test.stopTest();

        Medical_Facility__c facility = [
            SELECT Name, Street_Address__c, City__c
            FROM Medical_Facility__c
            LIMIT 1
        ];

        System.assertEquals('Klinika Testowa', facility.Name);
        System.assertEquals('City__c', facility.City__c);
    }

    private class MedicalFacilityMock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setStatusCode(200);
            res.setBody('[{"Name":"Klinika Testowa","Street_Address__c":"Marszałkowska","City__c":"Warszawa"}]');
            return res;
        }
    }
}