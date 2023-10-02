
import 'package:camera/camera.dart';

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Screens/camera_view_screen.dart';
import 'package:whatsapp_clone/Screens/video_view.dart';

List<CameraDescription> cameras = [];
class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _CameraScreenState();
  }
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;

  late Future<void> cameraValue;
  String videoPath = "";
  bool isRecording = false;
  bool flash=false;

  XFile? videoPath1;
  int rear = 0;
  @override
  void initState() {
    _cameraController = CameraController(cameras[rear], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  void takePhoto(BuildContext context) async {
    final imagePath = await _cameraController.takePicture();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CameraViewScreen(
                  path: imagePath.path,
                )));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                      child: CameraPreview(_cameraController));
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              color: Colors.black.withOpacity(0.3),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                          onPressed: () {
                            FlashMode.torch;
                           setState(() {
                             flash=!flash;
                           });
                           _cameraController.setFlashMode(flash?FlashMode.torch:FlashMode.off);
                          },
                          icon: Icon(
                            flash ?Icons.flash_on : Icons.flash_off,
                            color: Colors.white,
                            size: 28,
                          )),
                      GestureDetector(
                          onLongPress: () async {
                                _cameraController.startVideoRecording().then((value) {});
                            setState(() {
                              isRecording = true;
                            });
                          },
                          onLongPressUp: () async {
                              _cameraController.stopVideoRecording().then((XFile? file) {
                                if (mounted) {
                                  setState(() {
                                    isRecording = false;
                                    videoPath=file!.path;

                                  });
                                }
                              });

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        VideoViewScreen(path: videoPath)));
                          },
                          onTap: () {
                            if (!isRecording) {
                              takePhoto(context);
                            }
                          },
                          child: isRecording
                              ? const Icon(
                                  Icons.radio_button_on,
                                  color: Colors.red,
                                  size: 70,
                                )
                              : const Icon(
                                  Icons.panorama_fish_eye,
                                  color: Colors.white,
                                  size: 70,
                                )),
                      IconButton(
                          onPressed: () {
                            setState(() {

                              if (rear == 0) {
                                rear = 1;
                                _cameraController = CameraController(
                                    cameras[rear], ResolutionPreset.high);
                                cameraValue = _cameraController.initialize();
                              } else {
                                rear = 0;
                                _cameraController = CameraController(
                                    cameras[rear], ResolutionPreset.high);
                                cameraValue = _cameraController.initialize();
                              }
                            });
                          },
                          icon: Icon(
                            rear==1? Icons.camera_rear:Icons.camera_front,

                            color: Colors.white,
                            size: 28,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    "Hold for Video, tap for photo",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
