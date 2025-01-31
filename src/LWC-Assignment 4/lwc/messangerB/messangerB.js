import { LightningElement,wire } from 'lwc';
import demoMessageChannel from '@salesforce/messageChannel/demoMessageChannel__c';
import demoMessageChannel1 from '@salesforce/messageChannel/demoMessageChannel1__c';
import {MessageContext,publish,subscribe,unsubscribe} from 'lightning/messageService' ;

export default class MessangerB extends LightningElement {
  receivedMessageFromA ;
     @wire(MessageContext)
     messageContext;
 
     handleinput(event){
         let payload = {enteredvalue : event.detail.value};
         this.publish = publish(this.messageContext, demoMessageChannel, payload);
     }
     subscription = null ;
     connectedCallback(){
         this.subscription = subscribe(this.messageContext ,demoMessageChannel1, (message) => {
          this.receivedMessageFromA = message.value ;
         } );
     }
 
     disconnectedCallback(){
         unsubscribe(this.subscription);
     }    




}