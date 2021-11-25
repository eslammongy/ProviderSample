import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/provider/user_notifier.dart';

class UsersListScreen extends StatelessWidget {
  const UsersListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserNotifier userNotifier = Provider.of<UserNotifier>(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      child: _buildUsersList(context, userNotifier),
    );
  }

  Widget _buildUsersList(BuildContext context, UserNotifier userNotifier) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        context.watch<UserNotifier>().usersList[index].userName,
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).hintColor),
                      ),
                      Text(
                        context
                            .watch<UserNotifier>()
                            .usersList[index]
                            .userAddress,
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).hintColor),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Consumer<UserNotifier>(
                    builder: (_, notifier, __) => IconButton(
                      onPressed: () {
                        notifier.deleteSelectedUser(index);
                      },
                      icon: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Theme.of(context).hintColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: const Icon(Icons.delete_forever_rounded,
                            size: 30, color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            )),
      ),
      itemCount: context.watch<UserNotifier>().usersList.length,
    );
  }
}
