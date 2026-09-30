import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username;

  const ProfilePage({
    super.key,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 48,
              child: Icon(
                Icons.person,
                size: 48,
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 8),
            Text(
              username,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

                const Text(
                  'Saya Bersumpah mengerjakan soal kuis ini dengan cara yang jujur dan tidak curang dengan cara apapun',
                  style: TextStyle(
                    color: Color(0xFF9A877B),
                    fontSize: 13,
                  ),
                ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
