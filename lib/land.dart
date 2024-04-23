import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:permission_handler/permission_handler.dart';
import 'download.dart';
import 'package:flutter/services.dart';
import "dart:math" show pi;
import 'video_stream.dart';

class LandView extends StatefulWidget{
  const LandView({super.key});

  @override
  State<LandView> createState() => _LandState();

}

class _LandState extends State<LandView>{
  String url = '';
  String data = '';
  String result = '0';
  VideoStream vs = VideoStream();

  Future<void> send_Data(String url) async {
    await http.get(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return KeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKeyEvent: (event) async {
        print(event);
        if(event is KeyDownEvent){
          if (event.logicalKey.keyLabel == "W"){
            url = 'http://michiels-macbook-pro.local:5000/land?query=forward';
            await send_Data(url);
          }
          if (event.logicalKey.keyLabel == "A"){
            url = 'http://michiels-macbook-pro.local:5000/land?query=left';
            await send_Data(url);
          }
          if (event.logicalKey.keyLabel == "S"){
            url = 'http://michiels-macbook-pro.local:5000/land?query=backward';
            await send_Data(url);
          }
          if (event.logicalKey.keyLabel == "D"){
            url = 'http://michiels-macbook-pro.local:5000/land?query=right';
            await send_Data(url);
          }
          if (event.logicalKey.keyLabel == "Q"){
            url = 'http://michiels-macbook-pro.local:5000/land?query=anticlockwise';
            await send_Data(url);
          }
          if (event.logicalKey.keyLabel == "E"){
            url = 'http://michiels-macbook-pro.local:5000/land?query=clockwise';
            await send_Data(url);
          }
        }
        else if (event is KeyUpEvent){
          url = 'http://michiels-macbook-pro.local:5000/land?query=stop';
          await send_Data(url);
        }
      },
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: .75 * MediaQuery.of(context).size.width,
                height: .75  * MediaQuery.of(context).size.height,
                child: vs,
              ),
              Row (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Column(
                      children: [
                        GestureDetector(
                          onTapDown:  (details) async {
                            url = 'http://michiels-macbook-pro.local:5000/land?query=clockwise';
                            await send_Data(url);
                          },
                          onTapUp: (details) async {
                            url = 'http://michiels-macbook-pro.local:5000/land?query=stop';
                            await send_Data(url);
                          },
                          child: const Icon(
                            Icons.redo_outlined,
                          ),
                        ),

                        Transform.rotate(
                            angle: 180 * pi / 180,
                            child:
                            GestureDetector(
                              onTapDown:  (details) async {
                                url = 'http://michiels-macbook-pro.local:5000/land?query=anticlockwise';
                                await send_Data(url);
                              },
                              onTapUp: (details) async {
                                url = 'http://michiels-macbook-pro.local:5000/land?query=stop';
                                await send_Data(url);
                              },
                              child: const Icon(
                                Icons.undo_outlined,
                              ),
                            ),
                        ),
                      ]
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTapDown:  (details) async {
                            url = 'http://michiels-macbook-pro.local:5000/land?query=forward';
                            await send_Data(url);
                          },
                          onTapUp: (details) async {
                            url = 'http://michiels-macbook-pro.local:5000/land?query=stop';
                            await send_Data(url);
                          },
                          child: const Icon(
                            Icons.keyboard_arrow_up_outlined,
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              GestureDetector(
                                onTapDown:  (details) async {
                                  url = 'http://michiels-macbook-pro.local:5000/land?query=left';
                                  await send_Data(url);
                                },
                                onTapUp: (details) async {
                                  url = 'http://michiels-macbook-pro.local:5000/land?query=stop';
                                  await send_Data(url);
                                },
                                child: const Icon(
                                  Icons.keyboard_arrow_left_outlined,
                                ),
                              ),
                              GestureDetector(
                                onTapDown:  (details) async {
                                  url = 'http://michiels-macbook-pro.local:5000/land?query=right';
                                  await send_Data(url);
                                },
                                onTapUp: (details) async {
                                  url = 'http://michiels-macbook-pro.local:5000/land?query=stop';
                                  await send_Data(url);
                                },
                                child: const Icon(
                                  Icons.keyboard_arrow_right_outlined,
                                ),
                              ),
                            ]
                        ),
                        GestureDetector(
                          onTapDown:  (details) async {
                            url = 'http://michiels-macbook-pro.local:5000/land?query=backward';
                            await send_Data(url);
                          },
                          onTapUp: (details) async {
                            url = 'http://michiels-macbook-pro.local:5000/land?query=stop';
                            await send_Data(url);
                          },
                          child: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                          ),
                        ),
                      ]
                    ),
                  ]
                ),
              ],
          ),
        ),
    );
  }
}

