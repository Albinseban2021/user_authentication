import 'package:flutter/material.dart';
import 'package:user_authentication/verify.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(
    MaterialApp(home: Phone()),
  );
}

class Phone extends StatefulWidget {
  const Phone({super.key});
  static String verify = "";

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  TextEditingController phoneNumber = TextEditingController();
  bool visible = false;
  var temp;

  String? codeMobile;
  var mobile;

  @override
  void dispose() {
    phoneNumber.dispose();

    super.dispose();
  }

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
          icon: const Icon(Icons.close),
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Center(
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Please enter your mobile number',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "You'll recieve  a 4 dgit code \n to verify next. ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff6a6c7b),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: IntlPhoneField(
                        invalidNumberMessage: null,
                        showDropdownIcon: false,
                        dropdownTextStyle: TextStyle(fontSize: 20),
                        flagsButtonMargin:
                            const EdgeInsets.only(left: 10, right: 20),
                        decoration: InputDecoration(
                          counterText: '',
                          focusedErrorBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          hintText: 'Mobile Number',
                          hintStyle: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 106, 108, 123)),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                        ),
                        initialCountryCode: 'IN',
                        onChanged: (phone) {
                          setState(() {
                            codeMobile = phone.completeNumber;
                            mobile = phone.number;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    SizedBox(
                      width: 328,
                      child: ElevatedButton(
                          onPressed: () async {
                            String phoneNumberr =
                                '${codeMobile! + phoneNumber.text}';
                            await FirebaseAuthentication()
                                .sendOTP(phoneNumberr);
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) {
                                return Verification(
                                  phone: mobile,
                                );
                              },
                            ));
                          },
                          child: Text('CONTINUE')),
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/Vector 3.png',
                  ),
                  Positioned(
                    bottom: 0,
                    child: Image.asset(
                      'assets/images/Vector2.png',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FirebaseAuthentication {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> sendOTP(String codeMobile) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: codeMobile,
      verificationCompleted: (PhoneAuthCredential credential) {
        _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Failed to send OTP: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) async {
        Phone.verify = verificationId;
        print('OTP Sent! Verification ID: $verificationId');
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
