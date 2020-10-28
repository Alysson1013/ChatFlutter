import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextComposer extends StatefulWidget {

  TextComposer(this.sendMessage);
  Function(String) sendMessage;

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {

  void _reset(){
    _controller.clear();
    setState(() {
      _isComponsing = false;
    });
  }

  TextEditingController _controller = TextEditingController();
  bool _isComponsing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            IconButton(
                icon: Icon(Icons.photo_camera),
                onPressed: (){}
            ),
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration.collapsed(hintText: "Envie uma mensagem"),
                onChanged: (text){
                  setState(() {
                    _isComponsing = text.isNotEmpty;
                  });
                },
                onSubmitted: (text){
                    widget.sendMessage(text);
                    _reset();
                },
              ),
            ),
            IconButton(
                icon: Icon(Icons.send),
                onPressed: _isComponsing ? (){
                  widget.sendMessage(_controller.text);
                  _reset();
                } : null
            )
          ],
        ),
    );
  }
}
