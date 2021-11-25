import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider_sample/view/widgets/custom_button.dart';
import 'package:provider_sample/view/widgets/text_input_form.dart';

void showingGeneralDialog(BuildContext context, String signInType) {
  var etNameController = TextEditingController();
  var etAddressController = TextEditingController();
  var etPhoneController = TextEditingController();
  var height = MediaQuery.of(context).size.height;
  showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 600),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Container(
          margin: const EdgeInsets.only(top: 80),
          child: Material(
            animationDuration: const Duration(milliseconds: 400),
            color: Colors.black54.withAlpha(0),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: height * 0.5,
                  margin: const EdgeInsets.only(bottom: 80),
                  decoration: BoxDecoration(
                    color: HexColor("FEF5E4"),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(children: [
                    const SizedBox(
                      height: 30,
                    ),
                    showTextInputField(
                        labelText: "enter name",
                        textEditingController: etNameController),
                    const SizedBox(
                      height: 10,
                    ),
                    showTextInputField(
                        labelText: "enter address",
                        textEditingController: etAddressController),
                    const SizedBox(
                      height: 10,
                    ),
                    showTextInputField(
                        labelText: "enter phone",
                        textEditingController: etPhoneController),
                    const Spacer(),
                    Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
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
                                  Navigator.pop(context);
                                },
                                color: Colors.green,
                                textColor: Colors.white),
                          ],
                        ),
                      ),
                    )
                  ]),
                ),
              ],
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
