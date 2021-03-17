import 'package:firebase_database/firebase_database.dart';

class ThingsToDo {
  String status;
  String taskName;
  int duration;
  bool selected;
  DateTime startTime;
  DateTime scheduledDate;
  ThingsToDo(this.status, this.taskName, this.duration,
      this.selected, this.startTime, this.scheduledDate);
}