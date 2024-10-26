import 'package:flutter/material.dart';
import 'workout_selection_screen.dart';
import 'schedule_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Planner'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          _buildOption(context, 'Select Workout', Icons.fitness_center, WorkoutSelectionScreen()),
          _buildOption(context, 'My Schedule', Icons.calendar_today, ScheduleScreen()),
          _buildOption(context, 'Profile', Icons.person, ProfileScreen()),
        ],
      ),
    );
  }

  Widget _buildOption(BuildContext context, String title, IconData icon, Widget screen) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => screen)),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 10)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Icon(icon, color: Colors.blue, size: 30),
          ],
        ),
      ),
    );
  }
}