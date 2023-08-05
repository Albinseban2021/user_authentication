import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? job;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Please select your profile',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 28),
          Container(
            margin: const EdgeInsets.only(left: 18.0, right: 18.0),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                color: Colors.white),
            height: 100.0,
            child: RadioListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 13.0, horizontal: 7.0),
              title: Row(
                children: [
                  Image.asset(
                    'assets/images/shipper.png',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shipper',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Lorem ipsum dolor sit amet,\nconsectetur adipisicing',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              value: 'Shipper',
              groupValue: job,
              onChanged: (value) {
                setState(() {
                  job = value.toString();
                });
              },
            ),
          ),
          const SizedBox(
            height: 26,
          ),
          Container(
            margin: const EdgeInsets.only(left: 18.0, right: 18.0),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                color: Colors.white),
            height: 100.0,
            child: RadioListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 13.0, horizontal: 7.0),
              title: Row(
                children: [
                  Image.asset(
                    'assets/images/shipper.png',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Transporter',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Lorem ipsum dolor sit amet,\nconsectetur adipisicing',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              value: 'Transporter',
              groupValue: job,
              onChanged: (value) {
                setState(() {
                  job = value.toString();
                });
              },
            ),
          ),
          const SizedBox(
            height: 26,
          ),
          SizedBox(
            width: 328,
            child:
                ElevatedButton(onPressed: () async {}, child: Text('CONTINUE')),
          )
        ],
      ),
    ));
  }
}
