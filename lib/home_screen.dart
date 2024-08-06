import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_compressor_app/command.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            if (1 != 1) {
              await compressVideo("/Users/nikunjbhanderi/Downloads/video1.mp4");
              return;
            }
            if (1 != 1) {
              await compressVideo("/data/data/com.example.video_compressor_app/cache/videos/video.mp4");
              return;
            }
            XFile? videoPath = await ImagePicker().pickVideo(source: ImageSource.gallery);
            if (videoPath != null) {
              await compressVideo(videoPath.path);
            }
          },
          child: Text(
            "Compress Video",
          ),
        ),
      ),
    );
  }
}
