import { LightningElement ,api, track} from 'lwc';
import createContact from '@salesforce/apex/createContactRecordApexImperative.createContact';
export default class ContactSaveForm extends LightningElement {
     @api recordid;
     isShowModal= true;
     firstNamevar;
     lastnamevar;
     emailvar;
     phonenumbervar;
     @track contacts;
     errorMessage;

    hideModalBox(event){
        this.isShowModal = false ;
        const e = new CustomEvent('childevent', {
            detail : {
                value : false,
            } 
       })
       this.dispatchEvent(e);
    }
    handlechange(event){
        const field = event.target.label;
        if(field === 'FirstName')
        this.firstNamevar = event.detail.value;

        if(field === 'LastName')
        this.lastnamevar = event.detail.value;

        if(field === 'Email')
        this.emailvar = event.detail.value;

        if(field === 'Phone')
        this.phonenumbervar = event.detail.value;
    }
    
    //Calling Apex Imperatively
    async saveRecord(event){
        try {
            if(this.lastnamevar === undefined)
            {
              this.errorMessage="Last Name is Required";
            }
            else if(this.emailvar !== undefined && this.emailvar !== "" && !this.validateEmail(this.emailvar))
            { 
                
              this.errorMessage = "Please enter valid email.";

            }
            
            else{
            this.contacts = await createContact({ firstName: this.firstNamevar , lastName: this.lastnamevar , email: this.emailvar , phone : this.phonenumbervar, recordId : this.recordid});
            this.error = undefined;
            this.isShowModal = false ;
            const e = new CustomEvent('childevent1', 
            {
                detail :
                {
                    value : false ,
                    changevar : this.lastnamevar,
                } 
            } )
           this.dispatchEvent(e); 
            }
        }
        catch (error)
        {
            this.error = error;
            this.contacts = undefined;
        }
    }
        
        validateEmail(email) {
            const regexPattern = /[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
            return regexPattern.test(email);
        }
    }