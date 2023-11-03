import 'package:flutter/material.dart';
import 'package:ostad_practice/screen/photo_gallery.dart';

class PhotoDetails extends StatelessWidget {
  final PhotoModel photoModel;

  const PhotoDetails({super.key, required this.photoModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Photo Details")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ID: ${photoModel.id}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Image.network(photoModel.image),
            const SizedBox(height: 10),
            Text(photoModel.title, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
