import 'package:flutter/material.dart';
import 'package:glocery_shop_app/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 80, right: 80, top: 120, bottom: 40),
          child: Image.asset('lib/assets/avocado.png'),
        ),
        const SizedBox(height: 40),
        const Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            'We deliver groceries at your doorstep',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          "Fresh items everyday",
          style: TextStyle(color: Colors.grey[600]),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return const HomePage();
            }));
          },
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12)),
            child: const Text(
              "Get Started",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
        const Spacer()
      ]),
    );
  }
}
