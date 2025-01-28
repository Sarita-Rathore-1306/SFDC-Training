// recordViewCustomLayout.js
import { LightningElement, api } from "lwc";
import CONTACT_OBJECT from "@salesforce/schema/Contact";
import FNAME_FIELD from "@salesforce/schema/Contact.FirstName";
import LNAME_FIELD from "@salesforce/schema/Contact.LastName";
import PHONE_FIELD from "@salesforce/schema/Contact.Phone";
import EMAIL_FIELD from "@salesforce/schema/Contact.Email";
import ACCOUNTID_FIELD from "@salesforce/schema/Contact.AccountId";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class MyComponent extends LightningElement {
  // Expose a recordId property.
  @api recordId;
  isCreateRecord = false ;

  contactObject = CONTACT_OBJECT;
  fnameField = FNAME_FIELD;
  lnameField = LNAME_FIELD;
  phoneField = PHONE_FIELD;
  emailField = EMAIL_FIELD;
  accountidField = ACCOUNTID_FIELD ;

  handleClick(event){
      this.isCreateRecord = true ;
     
  }

  handleContactCreated() {
    // Run code when account is created.
    
     this.isCreateRecord = false ;
     const e = new ShowToastEvent({
                             title : 'Success!',
                             message : 'Contact Successfully Created',
                             variant : 'Success',
    });
      this.dispatchEvent(e);
  }

  handleClick1(event){
    console.log('i come in this block');
  }
  

}