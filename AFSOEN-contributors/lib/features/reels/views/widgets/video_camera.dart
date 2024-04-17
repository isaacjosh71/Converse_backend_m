import 'package:afsoen/features/reels/views/screens/upload_reels2.dart';
import 'package:afsoen/core/utils/colors.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:go_router/go_router.dart';

class VideoCamera extends StatefulWidget {
  static const routeName = "/upload-reels-content2";
  const VideoCamera({super.key});

  @override
  State<VideoCamera> createState() => _VideoCameraState();
}

class _VideoCameraState extends State<VideoCamera> {
  final GlobalKey<_VideoCameraState> myWidgetKey = GlobalKey();
  bool _isLoading = true;
  CameraController? _controller;
  // int _currentCameraIndex = 0;
  bool _isRecording = false;

  _initCamera() async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.back);
    _controller = CameraController(front, ResolutionPreset.max);
    // _controller = CameraController(cameras[_currentCameraIndex], ResolutionPreset.max);
    await _controller!.initialize();
    setState(() => _isLoading = false);
  }

  @override
  void initState() {
    _initCamera();
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  _recordVideo() async {
    if (_isRecording) {
      final file = await _controller!.stopVideoRecording();
      print(file.path);
      setState(() => _isRecording = false);
      final context = myWidgetKey.currentContext;
      if (context != null && context.mounted) {
        GoRoute(
          path: '/video-preview',
          name: "file",
          builder: (context, state) => VideoPage(filePath: state.pathParameters['filePath']!),
        );
        // GoRouter.of(context).pushNamed(
        //   '/video-preview',
        // );
        // GoRouter.of(context).pushNamed('/video-preview', params: {'filePath': file.path});
        context.goNamed("sample", pathParameters: {'filePath': file.path});
      }
    } else {
      await _controller!.prepareForVideoRecording();
      await _controller!.startVideoRecording();
      setState(() => _isRecording = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Container(
        // color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Center(
          child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CameraPreview(
            _controller!,
            child: Padding(
              padding: EdgeInsets.all(deviceWidth(context) * 0.03),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => GoRouter.of(context).pop(),
                        child: const Icon(
                          Icons.cancel_outlined,
                          color: AppColor.orangeColor,
                          size: 40,
                        ),
                      ),
                      SizedBox(width: deviceWidth(context) * 0.1),
                      Container(
                        width: deviceWidth(context) * 0.5,
                        height: deviceHeight(context) * 0.06,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(62, 62, 62, 0.6),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: deviceWidth(context) * 0.03),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.music_note,
                                size: 35,
                              ),
                              Text(
                                "Add Music",
                                style: TextStyle(
                                  color: AppColor.whiteColor,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              child: Icon(_isRecording ? Icons.stop : Icons.circle),
              onPressed: () => _recordVideo(),
            ),
          ),
        ],
      ));
    }
  }
}
