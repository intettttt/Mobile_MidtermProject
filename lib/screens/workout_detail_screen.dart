import 'package:flutter/material.dart';

class WorkoutDetailScreen extends StatelessWidget {
  final String title;

  WorkoutDetailScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title Workout'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title Statistics',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Workout Goals',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.deepPurpleAccent),
            ),
            SizedBox(height: 10),
            _buildGoals(),
          ],
        ),
      ),
    );
  }

  Widget _buildGoals() {
    return Column(
      children: [
        _buildGoalItem('💧 Drink more water', 8, 10, Colors.blueAccent),
        _buildGoalItem('🔥 Burn 500 calories', 500, 600, Colors.redAccent),
        _buildGoalItem('🏃 Steps goal', 7000, 10000, Colors.greenAccent),
      ],
    );
  }

  Widget _buildGoalItem(String goal, int current, int total, Color color) {
    double progress = current / total;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              goal,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$current / $total',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: LinearProgressIndicator(
                    value: progress,
                    color: color,
                    backgroundColor: color.withOpacity(0.3),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}