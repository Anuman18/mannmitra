import 'package:flutter/material.dart';
import 'screens/emotion_checkin.dart';
import 'screens/ai_chat.dart';
import 'screens/support_feed.dart';
import 'screens/create_post.dart';
import 'screens/bottom_nav.dart';


void main() {
  runApp(const MentalHealthApp());
}

class MentalHealthApp extends StatelessWidget {
  const MentalHealthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mental Health App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/checkin': (context) => const EmotionCheckInScreen(),
        '/ai_chat': (context) => const AIChatScreen(),
        '/feed': (context) => SupportFeedScreen(),
        '/create-post': (context) => const CreatePostScreen(),
        '/bottom-nav': (context) => const BottomNav(),

        // Add more routes here as we build other screens
      },
    );
  }
}
