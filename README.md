<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

## Note

The following code snippet demonstrates how to create background bubbles that span the entire screen using animation in a Flutter application.

## look this simple way

``` dart

import 'package:background_bubbles/background_bubbles.dart';

BubblesAnimation(
        backgroundColor: Colors.white,
        particleColor: Colors.indigo,
        particleCount: 500,
        particleRadius: 5,
        widget: Center(child: Text("Animated Bubbles")))

```



## Usage

To implement background bubbles spanning the entire screen using animation in a Flutter application, below is a sign-in design example for your reference.

## Examples

```

Background_Bubbles_package/
  lib/
    main.dart

```

Or


``` dart

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


```

📸 Screenshots

<img src="https://raw.githubusercontent.com/dineshkumars29/Background_Bubbles/master/assets/background_bubble_1.gif" alt="Colorful animated bubbles floating in the background" width="500" height="1000">

## Features

✅ Smooth Animation with Isolate:

Uses Isolate to keep the animation running smoothly without blocking the main UI thread.

✅ Customizable Bubble Shape:

Choose between circle and square shapes for your bubbles.

✅ Customizable Particle Count & Size:

Adjust the number and size of the particles to achieve the desired effect.

✅ Full-Screen Background:

Perfect for creating animated backgrounds for your login pages, splash screens, or home pages.

## Getting started

Particles can react to collisions with each other or with objects in their environment.

## Additional information

These techniques enable animators to craft unique experiences where randomness is combined with purposeful design decisions, resulting in visually appealing and responsive simulations. The possibilities are vast, limited only by one's imagination and technical skill set.
