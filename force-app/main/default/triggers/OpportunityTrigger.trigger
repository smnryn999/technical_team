trigger OpportunityTrigger on Opportunity (after update) {
    if(Trigger.isAfter && Trigger.isUpdate){
        OpportunityHandler.createTask(Trigger.new, Trigger.oldMap);
    }
}