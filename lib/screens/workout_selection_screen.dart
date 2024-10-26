import 'package:flutter/material.dart';
import 'workout_detail_screen.dart';

class WorkoutSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Workout'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildWorkoutOption(context, 'Cardio', Icons.directions_run),
          _buildWorkoutOption(context, 'Strength', Icons.fitness_center),
          _buildWorkoutOption(context, 'Yoga', Icons.self_improvement),
        ],
      ),
    );
  }

  Widget _buildWorkoutOption(BuildContext context, String title, IconData icon) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutDetailScreen(title: title))),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 10)],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue, size: 40),
            SizedBox(width: 20),
            Text(title, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}