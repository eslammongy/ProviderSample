import 'package:flutter/material.dart';
import 'package:provider_sample/view/widgets/displaying_edit_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Provider Sample",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.brightness_6_rounded)),
        ],
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showingGeneralDialog(context, "Wo");
        },
        child: const Icon(
          Icons.add_rounded,
          size: 30,
        ),
      ),
    );
  }
}
