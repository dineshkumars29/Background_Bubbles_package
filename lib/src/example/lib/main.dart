import 'package:background_bubbles/background_bubbles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Background Bubbles',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BubblesAnimation(
            backgroundColor: Colors.white,
            particleColor: Colors.indigo,
            particleCount: 500,
            particleRadius: 5,
            widget: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 5),
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
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 5),
                              child: TextFormField(
                                  decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Password',
                              )))),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(50),
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amberAccent,
                              // padding:
                              //     EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          child: const Text(
                            'Sign in',
                            style:
                                TextStyle(color: Colors.black, fontSize: 18.0),
                          ),
                        ),
                      )),
                ],
              ),
            )));
  }
}
