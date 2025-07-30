import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class EmotionCheckInScreen extends StatefulWidget {
  const EmotionCheckInScreen({super.key});

  @override
  State<EmotionCheckInScreen> createState() => _EmotionCheckInScreenState();
}

class _EmotionCheckInScreenState extends State<EmotionCheckInScreen> {
  final List<Map<String, dynamic>> moods = [
    {'emoji': '😊', 'label': 'Happy'},
    {'emoji': '😔', 'label': 'Sad'},
    {'emoji': '😡', 'label': 'Angry'},
    {'emoji': '😰', 'label': 'Anxious'},
    {'emoji': '😴', 'label': 'Tired'},
    {'emoji': '🤩', 'label': 'Excited'},
    {'emoji': '😕', 'label': 'Confused'},
    {'emoji': '😌', 'label': 'Calm'},
  ];

  int? selectedIndex;
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      appBar: AppBar(
        title: const Text("How are you feeling?"),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              itemCount: moods.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (_, index) {
                final mood = moods[index];
                final isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.deepPurple[100] : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected ? Colors.deepPurple : Colors.grey[300]!,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          mood['emoji'],
                          style: const TextStyle(fontSize: 32),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          mood['label'],
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _noteController,
              decoration: InputDecoration(
                hintText: "Want to add a note?",
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
              maxLines: 3,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: selectedIndex == null
                  ? null
                  : () {
                      final selectedMood = moods[selectedIndex!]['label'];
                      final note = _noteController.text.trim();
                      print("Selected mood: $selectedMood\nNote: $note");

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Thanks for checking in 💜"),
                          backgroundColor: Colors.deepPurple,
                        ),
                      );

                      setState(() {
                        selectedIndex = null;
                        _noteController.clear();
                      });
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                "Submit",
                style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
