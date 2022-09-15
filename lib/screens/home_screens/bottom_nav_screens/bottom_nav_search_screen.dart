import 'package:flutter/material.dart';

class BottomNavSearchScreen extends StatefulWidget {
  const BottomNavSearchScreen({Key? key}) : super(key: key);
  static const String id = '/search_screen';

  @override
  State<BottomNavSearchScreen> createState() => _BottomNavSearchScreenState();
}

class _BottomNavSearchScreenState extends State<BottomNavSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Search'),
    );
  }
}
