import 'package:flutter/material.dart';
import 'screens/splashScreen.dart';
import 'screens/HomeScreen.dart';
import 'screens/BlogsScreen.dart';
void main() {
  runApp(const QuantumBlog());
}

class QuantumBlog extends StatefulWidget {
  const QuantumBlog({Key? key}) : super(key: key);

  @override
  State<QuantumBlog> createState() => _QuantumBlogState();
}

class _QuantumBlogState extends State<QuantumBlog> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splashScreen',
      routes: {
        'splashScreen':(context)=>SplashScreen(),
        'home':(context)=>HomePage(),
        'blogsScreen':(context)=>BlogsScreen(),

      },
    );
  }
}
