import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_authentication/phone.dart';
import 'package:user_authentication/profile.dart';
import 'package:user_authentication/res/pin_input.dart';

class Verification extends StatefulWidget {
  final String? phone;

  const Verification({super.key, required this.phone});
  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Verify Phone',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Code is sent to ${widget.phone}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Color(0xff6A6C7B)),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              margin: const EdgeInsets.only(left: 32, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 48,
                    width: 48,
                    child: PinInput(first: true, last: false),
                  ),
                  SizedBox(
                    height: 48,
                    width: 48,
                    child: PinInput(first: false, last: false),
                  ),
                  SizedBox(
                    height: 48,
                    width: 48,
                    child: PinInput(first: false, last: false),
                  ),
                  SizedBox(
                    height: 48,
                    width: 48,
                    child: PinInput(first: false, last: false),
                  ),
                  SizedBox(
                    height: 48,
                    width: 48,
                    child: PinInput(first: false, last: false),
                  ),
                  SizedBox(
                    height: 48,
                    width: 48,
                    child: PinInput(first: false, last: true),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Didn’t receive the code?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Color(0xff6A6C7B)),
                ),
                GestureDetector(
                  onTap: () {
                    print('Text Clicked');
                  },
                  child: Text(
                    'Request Again',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            Container(
              margin: const EdgeInsets.only(left: 32.0, right: 16.0),
              height: 56,
              child: ElevatedButton(
                  onPressed: () async {
                    try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: Phone.verify, smsCode: code);

                      await auth.signInWithCredential(credential);
                      code = "";
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) {
                          return Profile();
                        },
                      ));
                    } catch (e) {
                      print("Wrong Otp");
                      print(code);
                      code = "";
                    }
                  },
                  child: const Text(
                    'VERIFY AND CONTINUE',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
