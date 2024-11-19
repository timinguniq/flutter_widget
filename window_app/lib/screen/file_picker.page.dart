import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerPage extends StatefulWidget {
  FilePickerPage({super.key});

  @override
  State<FilePickerPage> createState() => _FilePickerPageState();
}

class _FilePickerPageState extends State<FilePickerPage> {
  final TextEditingController _beforeController = TextEditingController();
  final TextEditingController _afterController = TextEditingController();
  var fileText = '클릭하여 이름 바꿀 파일을 올려주세요';
  List<File> files = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () async {
                      // TODO: 파일 업로드 프로세스 작업해야 됨.
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(allowMultiple: true);

                      if (result != null) {
                        files = result.paths.map((path) =>
                            File(path!)).toList();
                        files.map(
                                (e) {
                              log('e.path: ${e.path}');
                              return e;
                            }
                        ).toList();
                        if(files[0] != null){
                          changeFileNameOnly(files[0], 'abc');
                        }
                      } else {
                        // User canceled the picker
                        log('file error');
                      }
                    },
                    child: Container(
                      width: 500,
                      height: 500,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(fileText, style: const TextStyle(fontSize: 20)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // TODO: 파일명 넣는 editText 넣기
                  Row(
                    children: [
                      SizedBox(
                          width: 200,
                          height: 50,
                          child: TextEditField(
                            hintText: 'before',
                            controller: _beforeController,
                          )
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: TextEditField(
                          hintText: 'after',
                          controller: _afterController,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      onPressed: () {
                        // TODO: 파일 변경 프로세스 해야 됨.
                      },
                      child: Text('파일 이름 변경'),
                    ),
                  )
                ],
              )
            ],
          ),
        )
    );
  }

  Future<File> changeFileNameOnly(File file, String newFileName) {
    var path = file.path;
    var extensionList = path.split('.');
    var extension = extensionList[extensionList.length-1];
    var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
    var newPath = '${path.substring(0, lastSeparator + 1)}$newFileName.$extension';
    return file.rename(newPath);
  }
}

class TextEditField extends StatelessWidget {
  const TextEditField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: hintText,
      ),
    );
  }
}

