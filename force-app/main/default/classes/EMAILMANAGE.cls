public class EMAILMANAGE {
    public static void sendMail(List<Invoice__c> invoiceList) {
        String address; String subject; String body;
        
        Driver__c driverName;
        
        Invoice =i = invoiceList[0];
         address = i.Email__c;    
         subject = 'hi '+i.Name;         
            driverName = [SELECT Name, Phone__c FROM Driver__c WHERE Id=:i.Driver__c];
        body = 'Your order has been purchased succcessfully '+driverName.Name;

        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        
        Messaging.SendEmailResult[] results = Messaging.sendEmail(
                                 new Messaging.SingleEmailMessage[] { mail });
        
      
        inspectResults(results);
    }
    
    
    private static Boolean inspectResults(Messaging.SendEmailResult[] results) {
        Boolean sendResult = true;
        
        
        for (Messaging.SendEmailResult res : results) {
            if (res.isSuccess()) {
                System.debug('Email sent successfully');
            }
         
        }
        
        return sendResult;
    }
}