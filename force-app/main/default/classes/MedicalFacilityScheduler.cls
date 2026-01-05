global class MedicalFacilityScheduler implements Schedulable {

    global void execute(SchedulableContext sc) {
        MedicalFacilitySyncService.sync();
    }
}