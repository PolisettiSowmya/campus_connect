import 'package:flutter/material.dart';

// Continues EXPERIMENT 4(b): receives arguments passed via a named route.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map?;
    final name = args?['name'] ?? 'Guest';
    final year = args?['year'] ?? 'N/A';

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 45,
              backgroundColor: Colors.indigo,
              child: Icon(Icons.person, size: 45, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text('Name: $name', style: const TextStyle(fontSize: 18)),
            Text('Year: $year', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
