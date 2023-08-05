import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:user_authentication/phone.dart';

enum Category { English, Hindi, Bengali, Gujarati, Tamil, Malayalam, Odia }

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Category _selectedCategory = Category.English;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/image.png'),
                    const SizedBox(
                      height: 30,
                    ),
                    const Divider(
                      height: 45,
                    ),
                    const Text(
                      "Please select your Language",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "You can change the language \n at anytime",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff6A6C7B),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: 216.0,
                        height: 48.0,
                        padding: EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 47, 48, 55), width: 1),
                        ),
                        child: DropdownButton(
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 36,
                            isExpanded: true,
                            underline: SizedBox(),
                            style: TextStyle(
                                color: Color.fromARGB(255, 47, 48, 55),
                                fontSize: 16),
                            value: _selectedCategory,
                            items: Category.values
                                .map(
                                  (category) => DropdownMenuItem(
                                    value: category,
                                    child: Text(
                                      category.name.toString(),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                if (value == null) {
                                  return;
                                }
                                _selectedCategory = value;
                              });
                            }),
                      ),
                    ),
                    Divider(
                      height: 25,
                    ),
                    SizedBox(
                        width: 216,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) {
                                  return Phone();
                                },
                              ));
                            },
                            child: Text('NEXT'))),
                  ]),
            ),
            const Spacer(),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/Vector.png',
                  ),
                  Positioned(
                    bottom: 0,
                    child: Image.asset(
                      'assets/images/Vector-1.png',
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
