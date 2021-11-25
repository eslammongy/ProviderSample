import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/provider/user_notifier.dart';
import 'package:provider_sample/view/screens/users_list.dart';
import 'package:provider_sample/view/widgets/displaying_edit_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    UserNotifier userNotifier = Provider.of<UserNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Text(
          "Provider Sample",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.brightness_6_rounded)),
        ],
      ),
      body: const UsersListScreen(),
      floatingActionButton: Consumer<UserNotifier>(
        builder: (context, notifier, __) => FloatingActionButton(
          onPressed: () {
            showingGeneralDialog(context, userNotifier);
          },
          child: const Icon(
            Icons.add_rounded,
            size: 30,
          ),
        ),
      ),
    );
  }
}
