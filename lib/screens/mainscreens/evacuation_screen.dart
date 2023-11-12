import 'package:flutter/material.dart';

class EvacuationScreen extends StatefulWidget {
  const EvacuationScreen({super.key});

  @override
  State<EvacuationScreen> createState() => _EvacuationScreenState();
}

class _EvacuationScreenState extends State<EvacuationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const Center(
      child: Text('EvacuationScreen'),
    ));
  }
}
