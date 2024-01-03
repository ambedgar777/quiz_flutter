import 'package:flutter/material.dart';
import 'package:quiz_flutter/pages/question.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFedf3f6),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 220,
                      padding: const EdgeInsets.only(left: 20, top: 50.0),
                      decoration: const BoxDecoration(
                        color: Color(0xFF2a2b31),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Image.asset(
                              'assets/images/boy.jpg',
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 40),
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              'Ambedgar Omgar',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: const EdgeInsets.only(
                          top: 120, left: 20.0, right: 20.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            ),
                            child: Image.asset(
                              'assets/images/quiz.PNG',
                            ),
                          ),
                          const SizedBox(width: 30),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Play & Win',
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Play the quiz by\nguessing the image',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFFa4a4a4),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Quiz Categories',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CategoryContainer(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Question(category: 'Places'),
                            ),
                          );
                        },
                        imagePath: 'assets/images/place.png',
                        title: 'Places',
                      ),
                      CategoryContainer(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Question(category: 'Animals'),
                            ),
                          );
                        },
                        imagePath: 'assets/images/dog.png',
                        title: 'Animals',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CategoryContainer(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Question(category: 'Fruits'),
                            ),
                          );
                        },
                        imagePath: 'assets/images/fruit.png',
                        title: 'Fruits',
                      ),
                      CategoryContainer(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Question(category: 'Objects'),
                            ),
                          );
                        },
                        imagePath: 'assets/images/object.png',
                        title: 'Objects',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CategoryContainer(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Question(category: 'Sports'),
                            ),
                          );
                        },
                        imagePath: 'assets/images/sports.png',
                        title: 'Sports',
                      ),
                      CategoryContainer(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Question(category: 'Random'),
                            ),
                          );
                        },
                        imagePath: 'assets/images/random.png',
                        title: 'Random',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class CategoryContainer extends StatelessWidget {
  final String imagePath, title;
  void Function()? onTap;
  CategoryContainer({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 3,
        child: Container(
            width: 150,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Image.asset(
                  imagePath,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
