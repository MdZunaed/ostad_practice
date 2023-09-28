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
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = "John Doe";
    String description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s";
    String circleImage = "https://hips.hearstapps.com/hmg-prod/images/cute-cat-photos-1593441022.jpg?resize=1200:*";
    String squareImage = "https://www.kitnipbox.com/meow/wp-content/uploads/2020/06/HowtoBondwithYourKitten-1024x765.jpg";
    return Scaffold(
      appBar: AppBar(title:const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: OrientationBuilder(
          builder: (context, orientation) {
            return (orientation==Orientation.portrait)? Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(radius: 80,backgroundImage: NetworkImage(circleImage)),
                const SizedBox(height: 20),
                Text(title,style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                Text(description),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 10,mainAxisSpacing: 10,childAspectRatio: 1),
                      itemCount: 9,
                      itemBuilder: (context, index){
                    return Image.network(squareImage,fit: BoxFit.cover);
                  }),
                )
              ],
            ):Row(
              children: [
                Expanded(flex: 1,child: CircleAvatar(radius: 80,backgroundImage: NetworkImage(circleImage))),
                Expanded(flex: 2,child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    Text(description),
                    const SizedBox(height: 20),
                    Expanded(
                      child: GridView.builder(
                          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 10,mainAxisSpacing: 10),
                          itemCount: 9,
                          itemBuilder: (context, index){
                            return Image.network(squareImage,fit: BoxFit.cover);
                       }),
                    )
                  ],
                )),
              ],
            );
          },
        ),
      ),
    );
  }
}
