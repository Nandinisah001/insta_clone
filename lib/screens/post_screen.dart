// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:insta_clon/controllers/post_controller.dart';
// import 'package:insta_clon/screens/reels_screen.dart';
//
// import '../controllers/video_play_cntrol.dart';
// import 'video_upload.dart';
//
// class PostScreen extends StatefulWidget {
//   const PostScreen({super.key});
//
//   @override
//   State<PostScreen> createState() => _PostScreenState();
// }
//
// class _PostScreenState extends State<PostScreen> {
//   var postController = Get.put(PostController(postId: '', userId: '', videoPlayerControllerX: VideoPlayerControllerX(),));
//
// @override
//   // File? _mediaFile;
//   // bool _isVideo = false;
//   // final ImagePicker _picker = ImagePicker();
//   // final TextEditingController _titleController = TextEditingController();
//   // final TextEditingController _captionController = TextEditingController();
//   //
//   // Future<void> _pickMedia() async {
//   //   try {
//   //     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//   //     final pickedVideoFile = await _picker.pickVideo(source: ImageSource.gallery);
//   //
//   //     if (pickedVideoFile != null) {
//   //       setState(() {
//   //         _mediaFile = File(pickedVideoFile.path);
//   //         _isVideo = true;
//   //       });
//   //     } else if (pickedFile != null) {
//   //       setState(() {
//   //         _mediaFile = File(pickedFile.path);
//   //         _isVideo = false;
//   //       });
//   //     } else {
//   //       ScaffoldMessenger.of(context).showSnackBar(
//   //         SnackBar(content: Text('No media selected.')),
//   //       );
//   //     }
//   //   } catch (e) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text('Failed to pick media: $e')),
//   //     );
//   //   }
//   // }
//   //
//   // Future<void> _uploadPost() async {
//   //   if (_mediaFile == null || _titleController.text.isEmpty || captionController.text.isEmpty) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       const SnackBar(content: Text('Please select media and fill in title/caption.')),
//   //     );
//   //     return;
//   //   }
//
//   //   try {
//   //     String fileName = _isVideo
//   //         ? 'videos/${DateTime.now().millisecondsSinceEpoch}.mp4'
//   //         : 'images/${DateTime.now().millisecondsSinceEpoch}.jpg';
//   //     var ref = FirebaseFirestore .instance.ref().child(fileName);
//   //     await ref.putFile(_mediaFile!);
//   //
//   //     String mediaUrl = await ref.getDownloadURL();
//   //
//   //     final user = FirebaseAuth.instance.currentUser;
//   //     if (user == null) {
//   //       ScaffoldMessenger.of(context).showSnackBar(
//   //         const SnackBar(content: Text('User not logged in.')),
//   //       );
//   //       return;
//   //     }
//   //
//   //     await FirebaseFirestore.instance.collection('posts').add({
//   //       'userId': user.uid,
//   //       'mediaUrl': mediaUrl,
//   //       'title': _titleController.text,
//   //       'caption': _captionController.text,
//   //       'isVideo': _isVideo,
//   //     });
//   //
//   //     widget.onPost(_mediaFile!); // Ensure callback is called
//   //
//   //     setState(() {
//   //       _mediaFile = null;
//   //       _titleController.clear();
//   //       _captionController.clear();
//   //       _isVideo = false;
//   //     });
//   //
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       const SnackBar(content: Text('Post uploaded successfully!')),
//   //     );
//   //
//   //     Navigator.pop(context);
//   //   } catch (e) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text('Failed to upload post: $e')),
//   //     );
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("New Post"),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.upload),
//             onPressed: (){
//               Get.to(const ReelsScreen());
//             }
//             // postController.onPost,
//           ),
//         ],
//       ),
//       body: ListView(
//         children: [
//           GestureDetector(
//             onTap: postController.pickMedia,
//             child: Container(
//               height: 350,
//               // width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.grey[300],
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: Colors.grey),
//               ),
//               child: postController.mediaFile  != null
//                   ? ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: postController.isVideo
//                     ? AspectRatio(
//                   aspectRatio: 16 / 9,
//                    child: VideoPlayerWidget(videoFile: postController.mediaFile!, videoUrl: '',),
//                 )
//                     : Image.file(postController.mediaFile!, fit: BoxFit.cover),
//               )
//                   : Center(
//                 child: Icon(
//                   Icons.add_a_photo,
//                   color: Colors.grey[800],
//                   size: 50,
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(18.0),
//             child: TextField(
//               controller: postController .titleController,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 hintText: "Title",
//                 prefixIcon: const Icon(Icons.title),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(18.0),
//             child: TextField(
//               controller: postController.captionController,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 hintText: "Caption",
//                 prefixIcon: const Icon(Icons.closed_caption),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
