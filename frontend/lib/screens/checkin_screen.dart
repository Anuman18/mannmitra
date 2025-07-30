import 'package:flutter/material.dart';
import '../services/api_service.dart';


class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  _CheckInScreenState createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  int selectedMood = -1;
  final moods = ["😄", "🙂", "😐", "😢", "😡"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("How are you feeling?")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Choose your mood", style: TextStyle(fontSize: 22)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(moods.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedMood = index;
                  });
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: selectedMood == index
                      ? Colors.blueAccent
                      : Colors.grey[300],
                  child: Text(
                    moods[index],
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              ApiService.submitMood(selectedMood);
            },
            child: Text("Submit"),
          )
        ],
      ),
    );
  }
}
