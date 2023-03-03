import 'dart:convert';
import 'widgets/image_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';

class App extends StatefulWidget{
  @override
  createState(){
    return AppState();
  }
}

class AppState extends State<App>{
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async{
    counter++;
    var url = Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter');
    var response = await get(url);
    var imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(context){
      return MaterialApp(
        home: Scaffold(
          body: ImageList(images),
          floatingActionButton: FloatingActionButton(
            onPressed: fetchImage,
            child: Icon(Icons.add),
          ),
          appBar: AppBar(
            title: Text('Lets see some images!'),
          ),
        ),
      );
    }
}