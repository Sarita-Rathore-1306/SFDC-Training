import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {
   
    parenttochildvalue;
    childtoparentvalue;
    handleevent(event){
       this.childtoparentvalue = event.detail.value;  
        
    }
    handleInputChange(event){
        this.parenttochildvalue = event.detail.value ;
    }
   
}