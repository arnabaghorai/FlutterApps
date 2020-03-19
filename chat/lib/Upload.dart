// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/widgets.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_database/firebase_database.dart';

// class UploadImage extends StatelessWidget {
//   final phoneno, email, name, state, reward, age, sex;
//   UploadImage(this.phoneno, this.email, this.name, this.state, this.reward,
//       this.age, this.sex);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(brightness: Brightness.dark),
//       home: ImageCapture(phoneno, email, name, state, reward, age, sex),
//     );
//   }
// }

// /// Widget to capture and crop the image
// class ImageCapture extends StatefulWidget {
//   final phoneno, email, name, state, reward, age, sex;
//   ImageCapture(this.phoneno, this.email, this.name, this.state, this.reward,
//       this.age, this.sex);

//   createState() =>
//       _ImageCaptureState(phoneno, email, name, state, reward, age, sex);
// }

// class _ImageCaptureState extends State<ImageCapture> {
//   final phoneno, email, name, state, reward, age, sex;
//   _ImageCaptureState(this.phoneno, this.email, this.name, this.state,
//       this.reward, this.age, this.sex);

//   /// Active image fil
//   File _imageFile;

//   /// Cropper plugin
//   Future<void> _cropImage() async {
//     File cropped = await ImageCropper.cropImage(
//         sourcePath: _imageFile.path,
//         // ratioX: 1.0,
//         // ratioY: 1.0,
//         // maxWidth: 512,
//         // maxHeight: 512,
//         toolbarColor: Colors.purple,
//         toolbarWidgetColor: Colors.white,
//         toolbarTitle: 'Crop It');

//     setState(() {
//       _imageFile = cropped ?? _imageFile;
//     });
//   }

//   /// Select an image via gallery or camera
//   Future<void> _pickImage(ImageSource source) async {
//     File selected = await ImagePicker.pickImage(source: source);

//     setState(() {
//       _imageFile = selected;
//     });
//   }

//   /// Remove image
//   void _clear() {
//     setState(() => _imageFile = null);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomAppBar(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             IconButton(
//               icon: Icon(
//                 Icons.photo_camera,
//                 size: 30,
//               ),
//               onPressed: () => _pickImage(ImageSource.camera),
//               color: Colors.blue,
//             ),
//             IconButton(
//               icon: Icon(
//                 Icons.photo_library,
//                 size: 30,
//               ),
//               onPressed: () => _pickImage(ImageSource.gallery),
//               color: Colors.pink,
//             ),
//           ],
//         ),
//       ),
//       body: ListView(
//         children: <Widget>[
//           if (_imageFile != null) ...[
//             Container(
//                 padding: EdgeInsets.all(32), child: Image.file(_imageFile)),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 FlatButton(
//                   color: Colors.black,
//                   child: Icon(Icons.crop),
//                   onPressed: _cropImage,
//                 ),
//                 FlatButton(
//                   color: Colors.black,
//                   child: Icon(Icons.refresh),
//                   onPressed: _clear,
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(32),
//               child: Uploader(
//                   phoneno, email, name, state, reward, age, sex, _imageFile),
//             )
//           ]
//         ],
//       ),
//     );
//   }
// }

// /// Widget used to handle the management of
// class Uploader extends StatefulWidget {
//   final phoneno, email, name, state, reward, age, sex;
//   final File file;
//   Uploader(this.phoneno, this.email, this.name, this.state, this.reward,
//       this.age, this.sex, this.file);

//   // Uploader({Key key, this.file}) : super(key: key);

//   createState() =>
//       _UploaderState(phoneno, email, name, state, reward, age, sex, file);
// }

// class _UploaderState extends State<Uploader> {
//   final phoneno, email, name, state, reward, age, sex;
//   final File file;
//   _UploaderState(this.phoneno, this.email, this.name, this.state, this.reward,
//       this.age, this.sex, this.file);
//   final databaseReference = FirebaseDatabase.instance.reference();
//   final FirebaseStorage _storage =
//       FirebaseStorage(storageBucket: 'gs://chatroom-9612b.appspot.com');

//   StorageUploadTask _uploadTask;
//   // String name = "Sarah";

//   Future _startUpload() async {
//     String filePath = 'images/$name.png';

//     setState(() {
//       _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
//     });
//     StorageTaskSnapshot taskSnapshot = await _uploadTask.onComplete;
//     String downloadUrl = await taskSnapshot.ref.getDownloadURL();
//     print(downloadUrl);
//     databaseReference.child('track').child('$phoneno').set({
//       'download_img': downloadUrl
//       //name
//       // 'name': signupNameController.value.text,

//       // //aadahr
//       // //'aadhar' : signupAadharController.value.text,
//       // //email
//       // 'email': signupEmailController.value.text,
//       // //pass/\
//       // 'pass': signupPasswordController.value.text,
//       // 'rewards': ref,
//       // 'state': signupStateController.value.text,
//       // 'phoneno': signupPhoneNoController.value.text,
//       // 'age': signupAgeController.value.text,
//       // 'sex': signupGenderController.value.text,
//       //'crops': crops
//       //conf pass
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_uploadTask != null) {
//       return StreamBuilder<StorageTaskEvent>(
//           stream: _uploadTask.events,
//           builder: (context, snapshot) {
//             var event = snapshot?.data?.snapshot;

//             double progressPercent = event != null
//                 ? event.bytesTransferred / event.totalByteCount
//                 : 0;

//             return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   if (_uploadTask.isComplete)
//                     Text('🎉🎉🎉',
//                         style: TextStyle(
//                             color: Colors.greenAccent,
//                             height: 2,
//                             fontSize: 30)),
//                   if (_uploadTask.isPaused)
//                     FlatButton(
//                       child: Icon(Icons.play_arrow, size: 50),
//                       onPressed: _uploadTask.resume,
//                     ),
//                   if (_uploadTask.isInProgress)
//                     FlatButton(
//                       child: Icon(Icons.pause, size: 50),
//                       onPressed: _uploadTask.pause,
//                     ),
//                   LinearProgressIndicator(value: progressPercent),
//                   Text(
//                     '${(progressPercent * 100).toStringAsFixed(2)} % ',
//                     style: TextStyle(fontSize: 50),
//                   ),
//                 ]);
//           });
//     } else {
//       return FlatButton.icon(
//           color: Colors.blue,
//           label: Text('Upload to Firebase'),
//           icon: Icon(Icons.cloud_upload),
//           onPressed: _startUpload);
//     }
//   }
// }
