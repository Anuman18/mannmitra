import 'package:flutter/material.dart';

class EmotionCheckinScreen extends StatefulWidget {
  const EmotionCheckinScreen({Key? key}) : super(key: key);

  @override
  State<EmotionCheckinScreen> createState() => _EmotionCheckinScreenState();
}

class _EmotionCheckinScreenState extends State<EmotionCheckinScreen> {
  String? selectedMood;

  final List<Map<String, String>> moods = [
    {'emoji': '😊', 'label': 'Happy'},
    {'emoji': '😔', 'label': 'Sad'},
    {'emoji': '😡', 'label': 'Angry'},
    {'emoji': '😱', 'label': 'Anxious'},
    {'emoji': '😴', 'label': 'Tired'},
    {'emoji': '😐', 'label': 'Neutral'},
  ];

  void submitMood() {
    if (selectedMood != null) {
      // TODO: Save to backend or state
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Mood "$selectedMood" submitted')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
        title: const Text("How are you feeling today?"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: moods.map((mood) {
                final isSelected = selectedMood == mood['label'];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedMood = mood['label'];
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.teal : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: const Offset(2, 4),
                        ),
                      ],
                      border: Border.all(color: Colors.tealAccent.shade100),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          mood['emoji']!,
                          style: const TextStyle(fontSize: 30),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          mood['label']!,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: submitMood,
              child: const Text(
                "Submit",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
