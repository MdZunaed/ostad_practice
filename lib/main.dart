import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      "https://images.unsplash.com/photo-1615796153287-98eacf0abb13?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1579168765467-3b235f938439?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8NHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1583083527882-4bee9aba2eea?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8N3x8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1586289883499-f11d28aaf52f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8OXx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1506755855567-92ff770e8d00?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8OHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1604675223954-b1aabd668078?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTl8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
    ];
    return  Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:const Text("Photo Gallery")),
        body: Scrollbar(
          child: Column(
            children: [
             const SizedBox(height: 20),
             const Text(
                "Welcome to My Photo Gallery!",
                style: TextStyle(fontSize: 20)),
              Padding(
                padding:const EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    labelText: 'Search for photos',
                    hintText: 'Search for photos',
                  ))),
              Expanded(
                child: GridView.builder(
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                  itemCount: imageUrls.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Clicked Image $index'),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Image.network(imageUrls[index],height: 100,width: 100,fit: BoxFit.cover),
                          Text("photo $index")
                        ],
                      ),
                    );
                  },
                ),
              ),
              Expanded(child:
              ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index){
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrls[index]),
                  ),
                  title: Text("photo $index"),
                  subtitle: Text("Description for photo $index"),
                );
              })),
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        child:const Icon(Icons.upload),onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(
            content: Text('Photos Uploaded Successfully!'),
          ),
        );
      }),
    );
  }
}
