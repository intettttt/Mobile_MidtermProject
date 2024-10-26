import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  // Tracks which workout is expanded
  List<bool> _expandedList = [false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Schedule'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildScheduleItem(
            'Morning Workout',
            '7:00 AM',
            'Cardio',
            0, // Index for the expansion list
            exercises: [
              {'name': 'Running', 'duration': '30 mins'},
              {'name': 'Jump Rope', 'sets': '3', 'reps': '50'},
            ],
          ),
          _buildScheduleItem(
            'Evening Workout',
            '6:00 PM',
            'Strength Training',
            1, // Index for the expansion list
            exercises: [
              {'name': 'Squats', 'sets': '4', 'reps': '12'},
              {'name': 'Bench Press', 'sets': '4', 'reps': '10'},
              {'name': 'Deadlifts', 'sets': '3', 'reps': '8'},
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleItem(String title, String time, String type, int index, {required List<Map<String, String>> exercises}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 18)),
                  SizedBox(height: 5),
                  Text(type, style: TextStyle(color: Colors.grey)),
                ],
              ),
              Text(time, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              IconButton(
                icon: Icon(_expandedList[index] ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expandedList[index] = !_expandedList[index];
                  });
                },
              ),
            ],
          ),
          if (_expandedList[index])
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: _buildWorkoutDetails(exercises),
            ),
        ],
      ),
    );
  }

  Widget _buildWorkoutDetails(List<Map<String, String>> exercises) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: exercises.map((exercise) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(exercise['name'] ?? '', style: TextStyle(fontSize: 16)),
              if (exercise.containsKey('duration'))
                Text(exercise['duration'] ?? '', style: TextStyle(color: Colors.grey)),
              if (exercise.containsKey('sets') && exercise.containsKey('reps'))
                Text('${exercise['sets']} sets x ${exercise['reps']} reps', style: TextStyle(color: Colors.grey)),
            ],
          ),
        );
      }).toList(),
    );
  }
}