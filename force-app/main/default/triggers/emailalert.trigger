trigger AssetTrigger on Invoice__c (after update) {
    EMAILMANAGE.sendMail (Trigger.New);
  }