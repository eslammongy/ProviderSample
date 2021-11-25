import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider_sample/model/user_model.dart';
import 'package:provider_sample/provider/user_notifier.dart';
import 'package:provider_sample/view/widgets/custom_button.dart';
import 'package:provider_sample/view/widgets/text_input_form.dart';

void showingGeneralDialog(BuildContext context, UserNotifier userNotifier) {
  var etNameController = TextEditingController();
  var etAddressController = TextEditingController();
  var etPhoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 600),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Form(
          key: formKey,
          autovalidate: true,
          child: Material(
            animationDuration: const Duration(milliseconds: 400),
            color: Colors.black54.withAlpha(0),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 150, horizontal: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                const SizedBox(
                  height: 50,
                ),
                showTextInputField(
                  context: context,
                  labelText: "enter name",
                  textEditingController: etNameController,
                ),
                const SizedBox(
                  height: 10,
                ),
                showTextInputField(
                  context: context,
                  labelText: "enter address",
                  textEditingController: etAddressController,
                ),
                const SizedBox(
                  height: 10,
                ),
                showTextInputField(
                  context: context,
                  labelText: "enter phone",
                  textEditingController: etPhoneController,
                ),
                const Spacer(),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  child: Row(
                    children: [
                      buildCustomButton(
                          context: context,
                          text: "Cancel",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.red,
                          textColor: Colors.white),
                      const Spacer(),
                      buildCustomButton(
                          context: context,
                          text: "Save",
                          onPressed: () {
                            if (!formKey.currentState!.validate()) {
                              return;
                            } else {
                              formKey.currentState!.save();

                              userNotifier.addNewUser(UserModel(
                                  userName: etNameController.text,
                                  userAddress: etAddressController.text,
                                  userPhone: etPhoneController.text));
                              Navigator.pop(context);
                            }
                          },
                          color: Colors.green,
                          textColor: Colors.white),
                    ],
                  ),
                )
              ]),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      });
}
