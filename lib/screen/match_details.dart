import 'package:flutter/material.dart';
import 'package:ostad_practice/models/match_model.dart';

class MatchDetails extends StatelessWidget {
  final MatchModel match;

  const MatchDetails({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(match.matchName)),
      body: Column(
        children: [
          Center(
            child: Card(
              margin: const EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(match.matchName.toString(),
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 22)),
                    Text(match.goal.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24)),
                    Text("Time: ${match.time}",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text("Total Time: ${match.totalTime}",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
