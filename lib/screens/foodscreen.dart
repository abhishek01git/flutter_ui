import 'package:flutter/material.dart';

class MyStudentScreen extends StatefulWidget {
  const MyStudentScreen({super.key});

  @override
  State<MyStudentScreen> createState() => _MyStudentScreenState();
}

class _MyStudentScreenState extends State<MyStudentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 15,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurple),
            );
          },
        ),
      ),
    );
  }
}
