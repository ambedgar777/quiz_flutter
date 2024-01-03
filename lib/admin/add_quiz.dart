import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_flutter/service/database.dart';
import 'package:random_string/random_string.dart';

class AddQuiz extends StatefulWidget {
  const AddQuiz({super.key});

  @override
  State<AddQuiz> createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {
  String? value;
  // items category
  final List<String> quizItems = [
    'Animals',
    'Sports',
    'Random',
    'Fruits',
    'Objects',
    'Places'
  ];

  // image picker instance.
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  // function to fetch the image.
  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = image != null ? File(image.path) : null;
    setState(() {});
  }

  //function to upload item
  uploadItem() async {
    if (selectedImage != null &&
        option1Controller.text != '' &&
        option2Controller.text != '' &&
        option3Controller.text != '' &&
        option4Controller.text != '') {
      String addId = randomAlphaNumeric(10);

      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('blogImage').child(addId);
      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);
      var downloadUrl = await (await task).ref.getDownloadURL();
      Map<String, dynamic> addQuiz = {
        'Image': downloadUrl,
        'option1': option1Controller.text,
        'option2': option2Controller.text,
        'option3': option3Controller.text,
        'option4': option4Controller.text,
        'correct': correctAnswerController.text,
      };
      await DatabaseMethods().addQuizCategory(addQuiz, value!).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              'Quiz has been added successfully!',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        );
      });
    }
  }

  //controllers
  TextEditingController option1Controller = TextEditingController();
  TextEditingController option2Controller = TextEditingController();
  TextEditingController option3Controller = TextEditingController();
  TextEditingController option4Controller = TextEditingController();
  TextEditingController correctAnswerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Add Quiz',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Upload the quiz picture',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              selectedImage == null
                  ? GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: Center(
                        child: Material(
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Material(
                        elevation: 4.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.file(
                              selectedImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
              const SizedBox(height: 20),
              const Text(
                'Option 1',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: option1Controller,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter option 1',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black,
                      )),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Option 2',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: option2Controller,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter option 2',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black,
                      )),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Option 3',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: option3Controller,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter option 3',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black,
                      )),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Option 4',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: option4Controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter option 4',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Correct Answer',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: correctAnswerController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Correct Answer',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: quizItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) => setState(() {
                      this.value = value;
                    }),
                    dropdownColor: Colors.white,
                    hint: const Text('Select Category'),
                    iconSize: 36,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    value: value,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: uploadItem,
                child: Center(
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
