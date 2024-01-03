import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_flutter/admin/add_quiz.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  //To check what the user will enter.
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFededeb),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding:
                const EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 53, 51, 51),
                  Colors.black,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(
                top: Radius.elliptical(
                    MediaQuery.of(context).size.width, 110.0),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 60.0),
            child: Form(
              child: Column(
                children: [
                  const Text(
                    'Let\'s start with admin',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2.2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 50),
                          Container(
                            padding: const EdgeInsets.only(left: 20.0, top: 5.0),
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(255, 160, 160, 147),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: TextFormField(
                                controller: userNameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter username';
                                  }
                                },
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Username',
                                    hintStyle: TextStyle(
                                        color: Color.fromARGB(
                                            255, 160, 160, 147))),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Container(
                            padding: const EdgeInsets.only(left: 20.0, top: 5.0),
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(255, 160, 160, 147),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: TextFormField(
                                obscureText: true,
                                controller: userPasswordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter password';
                                  }
                                },
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                        color: Color.fromARGB(
                                            255, 160, 160, 147))),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          GestureDetector(
                            onTap: loginAdmin,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 20.0),
                              margin: const EdgeInsets.symmetric(horizontal: 20.0),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  //function to log the admin
  loginAdmin() {
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
      snapshot.docs.forEach((result) {
        if (result.data()['id'] != userNameController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Username is not correct',
                style: TextStyle(fontSize: 18),
              ),
            ),
          );
        } else if (result.data()['password'] !=
            userPasswordController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Your password is not correct',
                style: TextStyle(fontSize: 18),
              ),
            ),
          );
        } else{
          Route route = MaterialPageRoute(builder: (context) => const AddQuiz(),);
          Navigator.pushReplacement(context, route);
        }
      });
    });
  }
}
