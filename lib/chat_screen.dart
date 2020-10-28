import 'dart:io';
import 'package:chat/text_composer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void _sendMessage({String text, File imgFile}) async{

    //enviando mensagem com foto
    Map<String, dynamic> data = {};

    //imagens no Firebase
    if(imgFile != null){
      //inseri imagens no Firebase
      StorageUploadTask task = await FirebaseStorage.instance.ref().child(
        DateTime.now().microsecondsSinceEpoch.toString()
      ).putFile(imgFile);

      //retorna a url de download
      StorageTaskSnapshot taskSnapshot = await task.onComplete;
      String url = await taskSnapshot.ref.getDownloadURL();
      data['imgUrl'] = url;
    }

    if (text != null) data['text'] = text;

    Firestore.instance.collection('messages').add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Olá"),
        elevation: 0,
      ),
      body: TextComposer(_sendMessage),
    );
  }
}
