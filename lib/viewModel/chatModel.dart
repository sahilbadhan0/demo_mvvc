import 'dart:async';

class ChatModel{
  List<String> messageList= new List();
  StreamController<List<String>> messageStreamController=new StreamController<List<String>>();



 get getMessageStream{
  // StreamController<List<String>> messageStreamController = new StreamController<List<String>>();

   return messageStreamController.stream;
 }

  dispose(){
    messageStreamController.close();
  }


  handleSubmitted(String text ){
    print('submitted ');
  }
  sendMessage(String text ){
    print('send message');
    if(text!=''){
      messageList.add(text);
      messageStreamController.sink.add(messageList);
    }

  }

}