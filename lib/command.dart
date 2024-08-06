import 'package:ffmpeg_kit_flutter_min_gpl/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_min_gpl/return_code.dart';
import 'package:gal/gal.dart';
import 'package:path_provider/path_provider.dart';

Future<void> compressVideo(String inputPath) async {
  try {
    print("=================== $inputPath");
    DateTime dateTime = DateTime.now();
    var dir = await getTemporaryDirectory();
    String outputPath = "${dir.path}/${DateTime.now().microsecondsSinceEpoch}.mp4";
    // var command = '-i $inputPath -vcodec libx264 -crf 35 -preset ultrafast -tune fastdecode -y $outputPath';
    // var command = '-i $inputPath -vcodec mpeg4 -crf 40 -preset ultrafast -tune fastdecode -y $outputPath';
    var command = '-i $inputPath -vcodec libx264 -preset ultrafast -crf 35 -tune zerolatency -y $outputPath'; // new
    // var command = '-i $inputPath -vcodec libx264 -preset ultrafast -crf 45 -tune zerolatency -y $outputPath';
    var session = await FFmpegKit.execute(command);
    var returnCode = await session.getReturnCode();

    if (returnCode?.getValue() == ReturnCode.success) {
      print("=================== ${DateTime.now().difference(dateTime)}");
      Gal.putVideo(outputPath);
      print('Compression successful: $outputPath');
      await session.cancel();
    } else {
      print("=================== ${DateTime.now().difference(dateTime)}");
      print('Compression failed with code $returnCode');
      await session.cancel();
    }
  } catch (e) {
    print("=================== ${DateTime.now()}");
    print('Error: $e');
  }
}
