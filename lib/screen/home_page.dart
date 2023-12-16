import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ostad_practice/models/match_model.dart';
import 'package:ostad_practice/screen/match_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference matchListRef = firestore.collection("matches");
  List<MatchModel> matchList = [];

  Future<void> getMatchList() async {
    matchList.clear();
    final QuerySnapshot result = await matchListRef.get();
    for (QueryDocumentSnapshot data in result.docs) {
      matchList.add(MatchModel.fromMap(data.data() as Map<String, dynamic>));
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getMatchList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Match List")),
      body: RefreshIndicator(
        onRefresh: getMatchList,
        child: StreamBuilder(
            stream: matchListRef.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: matchList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(matchList[index].matchName),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MatchDetails(match: matchList[index])));
                        },
                      );
                    });
              } else {
                return const Center(child: Text("No Match Found!!"));
              }
            }),
      ),
    );
  }
}
