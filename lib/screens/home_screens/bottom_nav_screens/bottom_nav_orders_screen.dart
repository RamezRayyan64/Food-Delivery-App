import 'package:flutter/material.dart';

class BottomNavOrderScreen extends StatefulWidget {
  const BottomNavOrderScreen({Key? key}) : super(key: key);
  static const String id = '/order_screen';

  @override
  State<BottomNavOrderScreen> createState() => _BottomNavOrderScreenState();
}

class _BottomNavOrderScreenState extends State<BottomNavOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Order'),
    );
  }
}
