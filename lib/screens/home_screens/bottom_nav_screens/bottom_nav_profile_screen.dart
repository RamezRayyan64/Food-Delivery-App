import 'package:flutter/material.dart';

class BottomNavProfileScreen extends StatefulWidget {
  const BottomNavProfileScreen({Key? key}) : super(key: key);
  static const String id = '/profile_screen';

  @override
  State<BottomNavProfileScreen> createState() => _BottomNavProfileScreenState();
}

class _BottomNavProfileScreenState extends State<BottomNavProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile'),
    );
  }
}
