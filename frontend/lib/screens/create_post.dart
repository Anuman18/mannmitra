import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _controller = TextEditingController();

  void _submitPost() {
    final text = _controller.text.trim();
    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please write something before posting")),
      );
      return;
    }

    // For now, just show confirmation. Later, this should push to a shared state or DB.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Your anonymous post has been shared!")),
    );
    Navigator.pop(context); // Go back to feed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Anonymous Post"),
        backgroundColor: Colors.deepPurple.shade400,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Share your thoughts anonymously.\nYour identity is safe here.",
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              maxLines: 8,
              decoration: InputDecoration(
                hintText: "Write what's on your mind...",
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _submitPost,
              icon: const Icon(Icons.send),
              label: const Text("Post Anonymously"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple.shade400,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
