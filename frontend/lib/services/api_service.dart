import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://10.0.2.2:8000"; // For Android Emulator
  // If testing on iOS Simulator, change to "http://localhost:8000"

  static Future<void> submitMood(int moodIndex) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/mood'),
        headers: {"Content-Type": "application/json"},
        body: '{"mood": $moodIndex}',
      );

      if (response.statusCode == 200) {
        print("✅ Mood submitted!");
      } else {
        print("❌ Failed to submit mood: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ Error submitting mood: $e");
    }
  }
}
