import 'package:flutter/material.dart';
import 'package:video_compressor_app/home_screen.dart';

void main() {
  runApp(CompressVideo());
}

class CompressVideo extends StatefulWidget {
  const CompressVideo({super.key});

  @override
  State<CompressVideo> createState() => _CompressVideoState();
}

class _CompressVideoState extends State<CompressVideo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
