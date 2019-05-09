import 'package:demo_mvvc/viewModel/chatModel.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _textController = new TextEditingController();
  ChatModel viewMode = new ChatModel();
  get getAppBar {
    return new AppBar(
      title: Text('Chat'),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    viewMode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar,
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              Flexible(
                child: StreamBuilder<List<String>>(
                    stream: viewMode.getMessageStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, i) {
                              return ChatMessage(text: '${snapshot.data[i]}');
                            });
                      } else {
                        return Container();
                      }
                    }),
              ),
              buildTextComposer(),
            ],
          ),
        ));
  }

  Widget buildTextComposer() {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Flexible(
            child: new TextField(
              controller: _textController,
              onSubmitted: (text) {
                viewMode.handleSubmitted(text);
              },
              decoration:
                  new InputDecoration.collapsed(hintText: "Send a message"),
            ),
          ),
          new Container(
            margin: new EdgeInsets.symmetric(horizontal: 4.0),
            child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () {
                  viewMode.sendMessage(_textController.text);
                  _textController.clear();
                }),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  String _name = "Sahil";
  ChatMessage({this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(child: new Text(_name[0])),
          ),
          Container(
            child: Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8, top: 4, bottom: 4),
                child: new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                      child: new Text(text, maxLines: 50)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
