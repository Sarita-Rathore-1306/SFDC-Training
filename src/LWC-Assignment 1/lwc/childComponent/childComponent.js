import { LightningElement,api } from 'lwc';

export default class ChildComponent extends LightningElement {
    @api parentToChild;
    childToParent;
    handleInputChange(event){
         this.childToParent =event.detail.value;
         const e = new CustomEvent('childevent', {detail :{

              value: this.childToParent
         
         }
         })
         this.dispatchEvent(e);
         console.log('data');
         console.log('@@@' + e.detail.value);
    }

   
    
}