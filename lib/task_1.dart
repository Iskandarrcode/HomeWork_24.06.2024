import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Task1 extends StatefulWidget {
  const Task1({super.key});

  @override
  State<Task1> createState() => _Task1State();
}

class _Task1State extends State<Task1> {
  bool isTap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(224, 6, 76, 133),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(224, 6, 76, 133),
        centerTitle: true,
        title: const Text(
          "First Task",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            isTap = !isTap;
            setState(() {});
          },
          child: Container(
              width: 220,
              height: 100,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.4),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Stack(
                children: [
                  Positioned(
                    child: isTap
                        ? AnimatedAlign(
                            alignment: Alignment.topRight,
                            duration: const Duration(milliseconds: 800),
                            child: Lottie.asset("assets/lottie/road.json"),
                          )
                        : Lottie.asset("assets/lottie/cloud.json"),
                  ),
                  Positioned(
                    child: AnimatedAlign(
                      alignment: isTap ? Alignment.topLeft : Alignment.topRight,
                      duration: const Duration(milliseconds: 500),
                      child: Container(
                        width: 110,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: isTap
                              ? const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/airplane-grey.png"),
                                )
                              : const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/airplane-blue.png"),
                                ),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
