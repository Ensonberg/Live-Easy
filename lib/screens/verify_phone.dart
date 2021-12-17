import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_easy/services/firebase_auth_service.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyPhoneScreen extends StatefulWidget {
  static const routeName = "/verifyPhoneScreen";
  final String? phone;
  const VerifyPhoneScreen({Key? key, this.phone}) : super(key: key);

  @override
  _VerifyPhoneScreenState createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;
  @override
  void initState() {
    FirebaseAuthService.automaticPhoneVerification(context, widget.phone!);
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    // final phone = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: media.height,
          width: media.width,
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: media.height * 0.07,
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 21),
                      child: Row(
                        children: const [
                          Icon(
                              IconData(0xee85,
                                  fontFamily: 'MaterialIcons',
                                  matchTextDirection: true),
                              color: Colors.black),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: media.height * 0.06,
                  ),
                  const Text(
                    "Verify Phone",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: media.height * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 37, right: 37),
                    child: Text(
                      "Code is sent to ${widget.phone}",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff6A6C7B),
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: media.height * 0.05,
                  ),
                  Container(
                      height: media.height * 0.07,
                      width: media.width * 0.9,
                      child: PinCodeTextField(
                        length: 6,
                        keyboardType: TextInputType.phone,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 48,
                          selectedFillColor: const Color(0xff93D2F3),
                          selectedColor: const Color(0xff93D2F3),
                          fieldWidth: 48,
                          activeFillColor: const Color(0xff93D2F3),
                          activeColor: const Color(0xff93D2F3),
                          inactiveColor: const Color(0xff93D2F3),
                          inactiveFillColor: const Color(0xff93D2F3),
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: textEditingController,
                        onCompleted: (v) {
                          print("Completed");
                          FirebaseAuthService.manualPhoneVerification(
                            context,
                            v,
                          );
                        },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            //  currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                        appContext: context,
                      )),
                  SizedBox(
                    height: media.height * 0.02,
                  ),
                  TextButton(
                    onPressed: () {
                      FirebaseAuthService.automaticPhoneVerification(
                          context, widget.phone!);
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: 'Didn’t receive the code? ',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff6A6C7B),
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w400),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Request Again',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: media.height * 0.04,
                  ),
                  MaterialButton(
                    elevation: 4.0,
                    onPressed: () {
                      if (textEditingController.text.length > 6) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            (const SnackBar(content: Text("Enter OTP"))));
                      }

                      // Navigator.pushNamed(context, SelectProfileScreen.routeName),
                    },
                    child: Container(
                      height: media.height * 0.07,
                      width: media.width * 0.9,
                      decoration: const BoxDecoration(color: Color(0xff2E3B62)),
                      child: const Center(
                        child: Text(
                          "VERIFY AND CONTINUE",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: media.height * 0.02,
                  ),
                  CircularProgressIndicator(),
                ],
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.zero,
                child: SvgPicture.asset(
                  "assets/images/Group 31.svg",
                  height: media.height * 0.197,
                  width: double.infinity,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
