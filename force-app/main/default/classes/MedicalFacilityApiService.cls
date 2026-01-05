public with sharing class MedicalFacilityApiService {

    public static List<Medical_Facility__c> fetchFacilities() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:/MedicalFacilities');
        req.setMethod('GET');

        Http http = new Http();
        HttpResponse res = http.send(req);

        if (res.getStatusCode() != 200) {
            throw new CalloutException('API error');
        }

        return (List<Medical_Facility__c>) JSON.deserialize(
            res.getBody(),
            List<Medical_Facility__c>.class
        );
    }
}