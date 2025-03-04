import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class AccountSaveForm extends LightningElement {

 showSecondModal = false ;
 isShowModal = true ;
 recordId;
 

 handleSuccess(event){
   this.showSecondModal = true;
   this.isShowModal = false ;
   this.recordId = event.detail.id ;
   //This event has been created to send event to the parent component that account record has been created and you need to refresh the data of datatable
   const selectedEvent = new CustomEvent("selected");
   this.dispatchEvent(selectedEvent);
   //Show Account success message 
   this.showSuccessToast();
   
 }

    showSuccessToast(){
        const evt = new ShowToastEvent({
        title: 'Account Created!!',
        message: 'Account Record succesfully created',
        variant: 'success',
        mode: 'dismissable'
    });
    this.dispatchEvent(evt);
    }

 hideModalBox(event){

     this.isShowModal = false ;

 }


}