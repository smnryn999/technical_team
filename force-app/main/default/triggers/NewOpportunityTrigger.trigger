trigger NewOpportunityTrigger on Account (after insert, after update) {
    if(Trigger.isInsert){
        NewOpportunityHandler.newOpp(Trigger.new);
    }
    if(Trigger.isUpdate){
        NewOpportunityHandler.newOpp(Trigger.new);
    }
}