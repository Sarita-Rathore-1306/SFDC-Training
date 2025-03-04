import { LightningElement , api} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class AccountSaveForm extends LightningElement {
 showSecondModal = true ;
 @api accountId ;


 handleSuccess(event){

   this.showSecondModal = false;
   this.showSuccessToast();
   
 }

 showSuccessToast(){
        const evt = new ShowToastEvent({
        title: 'Contact Created!!',
        message: 'Contact Record succesfully created',
        variant: 'success',
        mode: 'dismissable'
    });
    this.dispatchEvent(evt);
    }

 hideModalBox(event){

    this.showSecondModal = false;

 }

 
}