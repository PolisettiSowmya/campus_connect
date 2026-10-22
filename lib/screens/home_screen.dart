import 'package:flutter/material.dart';

// EXPERIMENT 4(a): Set up navigation between different screens using Navigator.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Campus Connect')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.indigo,
                child: Icon(Icons.school, size: 40, color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text(
                'Welcome to Campus Connect',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                icon: const Icon(Icons.widgets),
                label: const Text('Widgets & Layouts Demo'),
                // Navigator.pushNamed -> Experiment 4(a)/(b)
                onPressed: () => Navigator.pushNamed(context, '/widgets'),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                icon: const Icon(Icons.phone_android),
                label: const Text('Responsive UI Demo'),
                onPressed: () => Navigator.pushNamed(context, '/responsive'),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                icon: const Icon(Icons.person),
                label: const Text('Go to Profile'),
                // Passing arguments through a named route.
                onPressed: () => Navigator.pushNamed(
                  context,
                  '/profile',
                  arguments: {'name': 'Aarav', 'year': 'III'},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
