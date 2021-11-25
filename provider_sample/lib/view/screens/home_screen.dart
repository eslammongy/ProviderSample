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
          title: Text(
            "Provider Sample",
            style: TextStyle(
                letterSpacing: 0.6,
                fontSize: 20,
                color: Theme.of(context).hintColor,
                fontWeight: FontWeight.w800),
          ),
          actions: [
            Consumer<UserNotifier>(
              builder: (context, notifier, __) => Container(
                margin: EdgeInsets.zero,
                width: 60,
                child: Switch(
                  onChanged: (val) {
                    notifier.toggleTheme();
                  },
                  value: notifier.darkTheme,
                ),
              ),
            ),
          ]),
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
