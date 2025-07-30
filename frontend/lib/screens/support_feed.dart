import 'package:flutter/material.dart';

class SupportFeedScreen extends StatefulWidget {
  const SupportFeedScreen({super.key});

  @override
  State<SupportFeedScreen> createState() => _SupportFeedScreenState();
}

class _SupportFeedScreenState extends State<SupportFeedScreen> {
  final List<Map<String, dynamic>> _posts = [
    {
      'text': 'Feeling overwhelmed with studies lately...',
      'likes': 12,
      'comments': 3,
    },
    {
      'text': 'Anyone else struggling with anxiety before exams?',
      'likes': 20,
      'comments': 7,
    },
    {
      'text': 'Had a bad day but trying to stay positive 🌻',
      'likes': 8,
      'comments': 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Support Feed"),
        backgroundColor: Colors.deepPurple.shade400,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          final post = _posts[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post['text'],
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.favorite, size: 18, color: Colors.red.shade400),
                      const SizedBox(width: 4),
                      Text('${post['likes']}'),
                      const SizedBox(width: 16),
                      const Icon(Icons.chat_bubble_outline, size: 18),
                      const SizedBox(width: 4),
                      Text('${post['comments']}'),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create-post');
        },
        backgroundColor: Colors.deepPurple.shade400,
        child: const Icon(Icons.edit),
      ),
    );
  }
}
