import 'package:camera/camera.dart';
import 'package:douyin_clone/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? controller;
  List<CameraDescription>? cameras;
  bool isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    if (cameras != null && cameras!.isNotEmpty) {
      controller = CameraController(cameras![0], ResolutionPreset.high);
      controller?.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {
          isCameraInitialized = true;
        });
      });
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Camera App'),
        //   leading: TextButton(
        //     onPressed: () {
        //       Navigator.pushNamed(context, HomeScreen.screenId);
        //     },
        //     child: Icon(Icons.close),
        //   ),
        // ),
        body: isCameraInitialized
            ? Stack(children: [
                CameraPreview(
                  controller!,
                ),
                Positioned(
                  top: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, HomeScreen.screenId);
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.white.withOpacity(0.9),
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 120,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(Icons.music_note),
                              const Text('选择音乐'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          try {
                            final image = await controller?.takePicture();
                            if (image != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text('Picture saved: ${image.path}')),
                              );
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey,
                              width: 4,
                            ),
                          ),
                          child: Center(
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              child: Icon(
                                Icons.circle,
                                size: 10,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ])
            : Center(child: CircularProgressIndicator()),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     try {
        //       final image = await controller?.takePicture();
        //       if (image != null) {
        //         ScaffoldMessenger.of(context).showSnackBar(
        //           SnackBar(content: Text('Picture taken: ${image.path}')),
        //         );
        //       }
        //     } catch (e) {
        //       print(e);
        //     }
        //   },
        //   child: Icon(Icons.camera),
        // ),
      ),
    );
  }
}
