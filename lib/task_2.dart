import 'package:flutter/material.dart';
import 'dart:async';

class Task2 extends StatefulWidget {
  const Task2({super.key});

  @override
  State<Task2> createState() => _Task2State();
}

class _Task2State extends State<Task2> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<String> _images = [
    "assets/images/1.jpg",
    "assets/images/2.jpeg",
    "assets/images/3.jpg",
    "assets/images/4.jpg",
    "assets/images/5.jpg",
    "assets/images/6.jpg",
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        if (_currentPage < _images.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(224, 6, 76, 133),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(224, 6, 76, 133),
        centerTitle: true,
        title: const Text(
          "Second Task",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          height: 300,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _images.length,
            itemBuilder: (BuildContext context, int index) => ImageContainer(
              imagePath: _images[index],
            ),
          ),
        ),
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  final String imagePath;

  const ImageContainer({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
