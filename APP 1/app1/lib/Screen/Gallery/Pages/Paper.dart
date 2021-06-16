import 'dart:io';

import 'package:app1/Bottom%20Navigation%20Bar/navigation.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Paper_Tab extends StatefulWidget {
  static const routeName = '/category - paper_tab';
  @override
  _Paper_TabState createState() => _Paper_TabState();
}

class _Paper_TabState extends State<Paper_Tab> {
  bool loading = false;
  double progress = 0.0;
  final Dio dio = Dio();
  Future<bool> saveFile(String url, String fileName) async {
    Directory directory;
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = await getExternalStorageDirectory();
          print(directory.path);
          String newPath = "";
          List<String> folders = directory.path.split("/");
          for (int x = 1; x < folders.length; x++) {
            String folder = folders[x];
            if (folder != "Android") {
              newPath += "/" + folder;
            } else {
              break;
            }
          }
          newPath = newPath + "/Papers";
          directory = Directory(newPath);
          print(directory.path);
        } else {
          return false;
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        File saveFile = File(directory.path + "/$fileName");
        await dio.download(url, saveFile.path,
            onReceiveProgress: (downloaded, totalSize) {
          setState(() {
            progress = downloaded / totalSize;
          });
        });
        if (Platform.isIOS) {
          await ImageGallerySaver.saveFile(saveFile.path,
              isReturnPathOfIOS: true);
        }
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  downloadFile() async {
    setState(() {
      loading = false;
    });
    bool downloaded = await saveFile(
        "https://firebasestorage.googleapis.com/v0/b/bunky-app-1.appspot.com/o/Screenshot%20(3).png?alt=media&token=62a0ddaa-1b96-4f9d-8aa4-83589ac4055f",
        "Image.jpg");
    {
      if (downloaded) {
        print("Print downlaoded");
      } else {
        print("Problem with downlaoding");
      }
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    String routeArgs = ModalRoute.of(context).settings.arguments;
    String subject = routeArgs;
    return Scaffold(
      body: Center(
        child: Container(
            child: loading
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LinearProgressIndicator(
                      minHeight: 10,
                      value: progress,
                    ),
                  )
                : FlatButton(
                    onPressed: () {
                      downloadFile();
                    },
                    child: Text('DOWNLOAD HERE'))),
      ),
      bottomNavigationBar: Navigation(
        selectedIndex: 2,
      ),
    );
  }
}
