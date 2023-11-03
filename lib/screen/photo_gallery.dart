import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ostad_practice/screen/photo_details.dart';

class PhotoGallery extends StatefulWidget {
  const PhotoGallery({super.key});

  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  List<PhotoModel> photoList = [];
  bool isLoading = false;

  Future<void> getPhoto() async {
    isLoading = true;
    setState(() {});
    final Response response =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    final responseData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (var item in responseData) {
        photoList.add(PhotoModel(
          item['id'],
          item['title'],
          item['thumbnailUrl'] ?? '',
          item['url'] ?? '',
        ));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("error")));
    }
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    getPhoto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Photo Gallery App")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: photoList.length,
              separatorBuilder: (c, i) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                return ListTile(
                    leading: Image.network(photoList[index].thumbnail),
                    title: Text(photoList[index].title),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PhotoDetails(photoModel: photoList[index])));
                    });
              }),
    );
  }
}

class PhotoModel {
  final int id;
  final String title;
  final String thumbnail;
  final String image;

  PhotoModel(this.id, this.title, this.thumbnail, this.image);
}
