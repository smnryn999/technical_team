trigger CaseTrigger on Case (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        CaseHandler.parentCase(Trigger.new);
    }
}