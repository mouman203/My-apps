import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MatchingGame extends StatefulWidget{
  State<MatchingGame> createState() => _MatchingGameState();
   MatchingGame({Key? key}): super (key: key);
  
}

class _MatchingGameState extends State<MatchingGame>{
  
  // varibales
  int? image1 = 1;
  int? image2 = 2;
  String message = "Welcome to the Matching Game!";

  //methods
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.bungeeSpiceTextTheme(Theme.of(context).textTheme.copyWith(
                bodyMedium: TextStyle(color: Colors.black, fontSize: 25),
              ),),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 113, 153, 173),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 202, 234, 249),
        appBar: AppBar(
          title: Center(
            child: Text('Matching Game',
            style: TextStyle(
  fontFamily: 'Momo Trust Display',
  fontSize: 30,
  fontVariations: [
    FontVariation('ital', 0),
    FontVariation('wght', 400)
  ],
),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            SizedBox(height: (50)),
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          image1 = math.Random().nextInt(9) + 1;
                          if (image1 == image2) {
                            message = "You have won the game!";
                          } else {
                            message = "Try Again!";
                          }
                        });
                      },
                      child: Image.asset('assets/image-$image1.png'),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            image2 = math.Random().nextInt(9) + 1;
                            if (image1 == image2) {
                              message = "You have won the game!";
                            } else {
                              message = "Try Again!";
                            }
                          });
                        },
                        child: Image.asset('assets/image-$image2.png'),
                      ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

  }
}