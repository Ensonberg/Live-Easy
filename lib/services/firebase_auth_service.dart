import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:live_easy/screens/screen.dart';

class FirebaseAuthService {
  static String _verificationCode = "";
  static FirebaseAuth auth = FirebaseAuth.instance;
  static Future automaticPhoneVerification(
      BuildContext ctx, String phone) async {
    await auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
          Navigator.of(ctx).pushNamed(SelectProfileScreen.routeName);
          ScaffoldMessenger.of(ctx)
              .showSnackBar((const SnackBar(content: Text('Verified'))));
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, resendToken) {
          _verificationCode = verficationID;
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          // setState(() {
          _verificationCode = verificationID;
          // });
        },
        timeout: Duration(seconds: 120));
  }

  static Future manualPhoneVerification(
    BuildContext ctx,
    String pin,
  ) async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: _verificationCode, smsCode: pin))
          .then((value) async {
        if (value.user != null) {
          Navigator.of(ctx).pushReplacementNamed(SelectProfileScreen.routeName);
          // return true;
          ScaffoldMessenger.of(ctx)
              .showSnackBar((const SnackBar(content: Text('Verified'))));
        }
      });
    } catch (e) {
      FocusScope.of(ctx).unfocus();
      ScaffoldMessenger.of(ctx)
          .showSnackBar((const SnackBar(content: Text('invalid OTP'))));
    }
  }

  static Future codeSent() async {
    await auth.verifyPhoneNumber(
      phoneNumber: '+44 7123 123 456',
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        String smsCode = 'xxxx';

        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);

        // Sign the user in (or link) with the credential
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException error) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
    );
  }
}
