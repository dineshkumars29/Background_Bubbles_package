import 'package:background_bubbles/background_bubbles.dart';
import 'package:flutter/material.dart';

class Bubbles extends StatefulWidget {
  const Bubbles({
    super.key,
  });

  @override
  State<Bubbles> createState() => _BubblesState();
}

class _BubblesState extends State<Bubbles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BubblesAnimation(
            particleCount: 100,
            particleColor: Colors.amberAccent,
            particleRadius: 25.0,
            particleSpeed: 2.0,
            shape: ParticleShape.circle,
            backgroundColor: Colors.blueAccent.withOpacity(0.5),
            widget: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: TextFormField(
                                  decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Email',
                              )))),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: TextFormField(
                                  decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Password',
                              )))),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(15),
                      child: SizedBox(
                        height: 45,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              // padding:
                              //     EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          child: const Text(
                            'Sign in',
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0),
                          ),
                        ),
                      )),
                ],
              ),
            )));
  }
}
