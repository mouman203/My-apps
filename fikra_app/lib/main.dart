import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(const Fikra());
}
class Fikra extends StatelessWidget{
  const Fikra ({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
          textTheme: GoogleFonts.merriweatherTextTheme(),
          appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightBlue[100],
        appBar: AppBar(
          title: Center(
            child: const Text("Fikra app",
                        style: TextStyle(fontSize: 24),
                        )
                    ),
        ),
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome to FIKRA",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/Logo.png',
                ),
              ),
            ],
          )
          ),
      ),
    );
  }
}