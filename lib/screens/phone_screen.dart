import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_easy/screens/screen.dart';

class PhoneScreen extends StatefulWidget {
  static const routeName = "/phoneScreen";
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final _textEditingController = TextEditingController();
  Country _selectedDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('90');

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
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
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 21),
                      child: Row(
                        children: const [
                          Icon(IconData(0xe16a, fontFamily: 'MaterialIcons'),
                              color: Colors.black),
                        ],
                      ),
                    ),
                  ),
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
                      "You’ll receive a 4 digit code\n"
                      "to verify next.",
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
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Flexible(
                              child: InkWell(
                                  onTap: _openCountryPickerDialog,
                                  child:
                                      _buildDialogItem(_selectedDialogCountry)))
                          // CountryPickerDropdown(
                          //   initialValue: 'AR',
                          //   // itemFilter: ['AR', 'DE', 'GB', 'CN'],
                          //   isExpanded: false,
                          //   icon: Text("hi"),
                          //   itemBuilder: _buildDropdownItem,
                          //   priorityList: [
                          //     CountryPickerUtils.getCountryByIsoCode('GB'),
                          //     CountryPickerUtils.getCountryByIsoCode('CN'),
                          //   ],
                          //   sortComparator: (Country a, Country b) =>
                          //       a.isoCode.compareTo(b.isoCode),
                          //   onValuePicked: (Country country) {
                          //     print("${country.name}");
                          //   },
                          // ),
                          ,
                          SizedBox(
                            width: media.width * 0.56,
                            child: Row(
                              children: [
                                const Text(
                                  "-",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: _textEditingController,
                                    keyboardType: TextInputType.phone,
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: Colors.black),
                                    decoration: const InputDecoration(
                                      hintText: "Phone Number",
                                      hintStyle: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Color(0xff6A6C7B)),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: media.height * 0.03,
                  ),
                  MaterialButton(
                    elevation: 4.0,
                    onPressed: () {
                      if (_textEditingController.text.isEmpty ||
                          _textEditingController.text == "") {
                        ScaffoldMessenger.of(context)
                            .showSnackBar((const SnackBar(
                          content: Text('Enter phone number'),
                          backgroundColor: Colors.red,
                        )));
                      }
                      if (validateMobile(_textEditingController.text)) {
                        print(
                            "+${_selectedDialogCountry.phoneCode}${_textEditingController.text}");
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => VerifyPhoneScreen(
                                  phone:
                                      "+${_selectedDialogCountry.phoneCode}${_textEditingController.text}",
                                )));
                        // // Navigator.pushNamed(
                        //     context, VerifyPhoneScreen.routeName,arguments:_textEditingController.text );
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar((const SnackBar(
                          content: Text('Enter phone number'),
                          backgroundColor: Colors.red,
                        )));
                      }
                    },
                    child: Container(
                      height: media.height * 0.07,
                      width: media.width * 0.9,
                      decoration: const BoxDecoration(color: Color(0xff2E3B62)),
                      child: const Center(
                        child: Text(
                          "CONTINUE",
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

  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(width: 8.0),
          Text("+${country.phoneCode}"),
          SizedBox(width: 8.0),
        ],
      );
  void _openCountryPickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.pink),
          child: CountryPickerDialog(
            titlePadding: EdgeInsets.all(8.0),
            searchCursorColor: Colors.pinkAccent,
            searchInputDecoration: const InputDecoration(hintText: 'Search...'),
            isSearchable: true,
            title: Text('Select your phone code'),
            onValuePicked: (Country country) =>
                setState(() => _selectedDialogCountry = country),
            itemBuilder: _buildDialogItem,
            priorityList: [
              CountryPickerUtils.getCountryByIsoCode('TR'),
              CountryPickerUtils.getCountryByIsoCode('US'),
            ],
          ),
        ),
      );

  Widget _buildDropdownItem(Country country) => Container(
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            SizedBox(
              width: 8.0,
            ),
            Text("+${country.phoneCode}(${country.isoCode})"),
          ],
        ),
      );
}

bool validateMobile(String value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return false;
  } else if (!regExp.hasMatch(value)) {
    return false;
  } else {
    return true;
  }
}
