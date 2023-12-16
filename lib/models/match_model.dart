class MatchModel {
  final String matchName;
  final String goal;
  final String time;
  final String totalTime;

  MatchModel(this.matchName, this.goal, this.time, this.totalTime);

  factory MatchModel.fromMap(Map<String, dynamic> match) {
    return MatchModel(
      match["match name"],
      match["goal"],
      match["time"],
      match["total time"],
    );
  }
}
// class MatchModel {
//   String matchName;
//   String goal;
//   String time;
//   String totalTime;
//
//   MatchModel(
//       {required this.matchName,
//         required this.goal,
//         required this.time,
//         required this.totalTime});
// }

// class MatchModel {
//   String? matchName;
//   String? goal;
//   String? time;
//   String? totalTime;
//
//   MatchModel({this.matchName, this.goal, this.time, this.totalTime});
//
//   MatchModel.fromMap(Map<String, dynamic> map) {
//     matchName = map["match name"];
//     goal = map["goal"];
//     time = map["time"];
//     totalTime = map["totalTime"];
//   }
// }
