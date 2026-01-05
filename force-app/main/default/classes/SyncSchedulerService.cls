public with sharing class SyncSchedulerService {

    public static void reschedule() {
        Sync_Config__c config = [
            SELECT Cron_Expression__c, Is_Active__c
            FROM Sync_Config__c
            LIMIT 1
        ];

        for (CronTrigger ct :
            [SELECT Id FROM CronTrigger WHERE CronJobDetail.Name = 'MedicalFacilityJob']) {
            System.abortJob(ct.Id);
        }

        if (config.Is_Active__c) {
            System.schedule(
                'MedicalFacilityJob',
                config.Cron_Expression__c,
                new MedicalFacilityScheduler()
            );
        }
    }
}