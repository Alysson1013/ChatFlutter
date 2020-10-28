import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextComposer extends StatefulWidget {
  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
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
                decoration: InputDecoration.collapsed(hintText: "Envie uma mensagem"),
                onChanged: (text){
                  setState(() {
                    _isComponsing = text.isNotEmpty;
                  });
                },
                onSubmitted: (text){

                },
              ),
            ),
            IconButton(
                icon: Icon(Icons.send),
                onPressed: _isComponsing ? (){

                } : null
            )
          ],
        ),
    );
  }
}
