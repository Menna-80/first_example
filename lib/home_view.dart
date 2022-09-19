import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ClassificationScreen extends StatefulWidget {
  @override
  State<ClassificationScreen> createState() => _ClassificationScreenState();
}

class _ClassificationScreenState extends State<ClassificationScreen> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classification'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: 440,
                width: double.infinity,
                child: image == null
                    ? Center(child: Text('No Selected Images',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),)
                    : Image.file(image!)),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: pickImage,
                  child: Text(
                    'Pick image',
                  ),
                ),
                SizedBox(
                  width: 25.0,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Classification',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future pickImage() async {
    final Pickedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(Pickedimage!.path);
    });
  }
}
