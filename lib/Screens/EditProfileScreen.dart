import 'package:flutter/material.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfileScreen extends StatefulWidget {
  //const EditProfileScreen({Key? key}) : super(key: key);
  final ValueChanged<String>? onChangedName;

  EditProfileScreen({this.onChangedName});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var image;
  String _photoCheckIn = "";
  String _photoCheckOut = "";
  

  void _openCamera() async {
    final ImagePicker picker = ImagePicker();
    var photo = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      image = photo;
      print(image);
    });
  }

  void _openPhotoLibrary() async {
    final ImagePicker picker = ImagePicker();
    var photo = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = photo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profil'),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => _showChoiceDialog(context),
                  child:
                  image == null ?
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: 
                        
                        AssetImage('assets/takepicture.png')
                            
                      )
                    ),
                  ) : Image.file(File(image.path)),
                ),
                TextFormField(
                  maxLines: 1,
                  initialValue: '',
                  onChanged: widget.onChangedName,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(), labelText: 'Name'),
                  validator: (name) {
                    if (name!.isEmpty) {
                      return 'Please Enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  maxLines: 1,
                  initialValue: '',
                  onChanged: widget.onChangedName,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Alamat Rumah'),
                  validator: (name) {
                    if (name!.isEmpty) {
                      return 'Please Enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  maxLines: 1,
                  initialValue: '',
                  onChanged: widget.onChangedName,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Alamat Kerja'),
                  validator: (name) {
                    if (name!.isEmpty) {
                      return 'Please Enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  maxLines: 1,
                  initialValue: '',
                  onChanged: widget.onChangedName,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Nombor telefon'),
                  validator: (name) {
                    if (name!.isEmpty) {
                      return 'Please Enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  maxLines: 1,
                  initialValue: '',
                  onChanged: widget.onChangedName,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'No Telefon Rumah'),
                  validator: (name) {
                    if (name!.isEmpty) {
                      return 'Please Enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Text('MAKLUMAT PASANGAN'),
                TextFormField(
                  maxLines: 1,
                  initialValue: '',
                  onChanged: widget.onChangedName,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Nama Pasangan'),
                  validator: (name) {
                    if (name!.isEmpty) {
                      return 'Please Enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  maxLines: 1,
                  initialValue: '',
                  onChanged: widget.onChangedName,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'No Telefon Rumah'),
                  validator: (name) {
                    if (name!.isEmpty) {
                      return 'Nombor Telefon Pasangan';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  maxLines: 1,
                  initialValue: '',
                  onChanged: widget.onChangedName,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Alamat Kerja Pasangan'),
                  validator: (name) {
                    if (name!.isEmpty) {
                      return 'Please Enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 250,
                    ),
                    SizedBox(
                      width: 80,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Hantar'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text('Gallery'),
                    onTap: () {
                      _openPhotoLibrary();
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: Text('Camera'),
                    onTap: () {
                      _openCamera();
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
}
