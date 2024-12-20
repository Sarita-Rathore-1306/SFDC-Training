/*
 Purpose      : This Class has been created to add primary contact on Account.

 Created By   : Sarita Rathore

 Created Date : 20/12/2024

 Revision_log : V1_0  - Created by Sarita Rathore

*/

public class AddPrimaryContact implements Queueable {
    public  Contact cont ;
    public  String state ;
    public AddPrimaryContact(Contact con , String str){
        this.cont = con ;
        this.state = str ;
    }
    public void execute(QueueableContext ctx){
      List<Contact> listOfContacts = new List<Contact>() ;
        for(Account acc :[SELECT Id FROM Account WHERE BillingState = :state LIMIT 200]){
            Contact con = cont.clone();
            con.AccountId = acc.Id;
            listOfContacts.add(con);
        }
        if(!listOfContacts.isEmpty()){
            insert listOfContacts;
        }
    }
}