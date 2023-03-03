import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget{
  final List<ImageModel> images;

  const ImageList(this.images, {super.key});

  @override
  Widget build(context){
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index){
          return buildImage(images[index]);
      },
    );
  }

  Widget buildImage(ImageModel image){
      return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black)
        ),
        margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Image.network(image.url),
            ),

            Text(image.title),
          ],
        ),
      );
  }
}