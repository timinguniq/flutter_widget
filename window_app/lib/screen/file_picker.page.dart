import 'package:flutter/material.dart';

class FilePickerPage extends StatelessWidget {
  FilePickerPage({super.key});

  final TextEditingController _beforeController = TextEditingController();
  final TextEditingController _afterController = TextEditingController();

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
                  onTap: () async{
                    // TODO: 파일 업로드 프로세스 작업해야 됨.
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
              ],
            )
          ],
        ),
      )
    );
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

