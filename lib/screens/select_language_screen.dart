import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'phone_screen.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({Key? key}) : super(key: key);

  @override
  _SelectLanguageScreenState createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  String dropDownValue = 'English';
  var items = [
    'English',
    'French',
    'Spanish',
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: media.height,
          width: media.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 135),
                child: Column(
                  children: [
                    Center(child: SvgPicture.asset("assets/images/image.svg")),
                    SizedBox(
                      height: media.height * 0.06,
                    ),
                    const Text(
                      "Please select your Language",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: media.height * 0.01,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 37, right: 37),
                      child: Text(
                        "You can change the language at any time",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff6A6C7B),
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: media.height * 0.03,
                    ),
                    Container(
                      height: media.height * 0.062,
                      width: media.width * 0.6,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          isExpanded: true,
                          underline: Container(),
                          value: dropDownValue,
                          icon: const Icon(
                            Icons.arrow_drop_down_sharp,
                            color: Color(0xff9C9C9C),
                          ),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                                value: items,
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(items),
                                  ],
                                ));
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              dropDownValue = newValue.toString();
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: media.height * 0.03,
                    ),
                    MaterialButton(
                      elevation: 4.0,
                      onPressed: () =>
                          Navigator.pushNamed(context, PhoneScreen.routeName),
                      child: Container(
                        height: media.height * 0.062,
                        width: media.width * 0.6,
                        decoration:
                            const BoxDecoration(color: Color(0xff2E3B62)),
                        child: const Center(
                          child: Text(
                            "Next",
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
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.zero,
                child: SvgPicture.asset(
                  "assets/images/Group 3.svg",
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
