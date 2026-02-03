trigger AccountTrigger on Account (before insert, before update) {
    
    AccountTriggerHandler.handleAccountAutomation(Trigger.new, Trigger.oldMap);
}