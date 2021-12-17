import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectProfileScreen extends StatefulWidget {
  static const routeName = "/selectProfileScreen";
  const SelectProfileScreen({Key? key}) : super(key: key);

  @override
  _SelectProfileScreenState createState() => _SelectProfileScreenState();
}

class _SelectProfileScreenState extends State<SelectProfileScreen> {
  bool isShipper = false;
  bool isTransporter = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: media.height * 0.12,
          ),
          const Center(
            child: Text(
              "Please select your Profile",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: media.height * 0.04,
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                isShipper=true;
                isTransporter=false;
              });
              // bool isShipper=false;
            },
            child: Container(
              height: media.height * 0.12,
              width: media.width * 0.9,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1)),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 30,
                      child: Transform.scale(
                        scale: 0.7,
                        child: Container(
                          decoration: BoxDecoration(
                            color:  isShipper ? const Color(0xff2E3B62): Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 1.5),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      "assets/images/Group.svg",
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Shipper",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w400),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text(
                            "Lorem ipsum dolor sit amet,\n consectetur adipiscing",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: media.height * 0.04,
          ),
          MaterialButton(
            onPressed: (){
              setState(() {
                isShipper=false;
                isTransporter=true;
              });
            },
            child: Container(
              height: media.height * 0.12,
              width: media.width * 0.9,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1)),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 30,
                      child: Transform.scale(
                        scale: 0.7,
                        child: Container(
                          decoration: BoxDecoration(
                            color:  isTransporter ? const Color(0xff2E3B62): Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 1.5),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      "assets/images/Group11.svg",
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Transporter",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w400),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text(
                            "Lorem ipsum dolor sit amet,\n consectetur adipiscing",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: media.height * 0.04,
          ),
          MaterialButton(
            elevation: 4.0,
            onPressed: () {},
            child: Container(
              height: media.height * 0.1,
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
    );
  }
}
