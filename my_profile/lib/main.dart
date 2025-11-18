import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const Profile());
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  void lunchUri(Uri uri) async {
    print("M gonna launch the uri");
    if(!await canLaunchUrl(uri) ){
       print("The uri is launchable");
      await launchUrl(uri,mode: LaunchMode.externalApplication); 
    }else{
      print("The uri is not launchable");
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme :ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: const Color.fromARGB(255, 68, 255, 252),
          ),
          scaffoldBackgroundColor: const Color.fromARGB(255, 180, 238, 233),
        ),
      home : Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('My Profile',
              style: GoogleFonts.lobster(
                textStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ), 
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Profile Image
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 10,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "assets/me.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Name Text
              Text(
                'Arros Abdelmoumane',
                style: GoogleFonts.lobster(
                  textStyle: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Divider Line
              Container(
                height: 2,
                width:  MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              // Description Text
              Text("Flutter developer | Mobile app enthusiast | Turning ideas into functional and beautiful applications",
                textAlign: TextAlign.center,
                style:TextStyle(
                    fontSize: 15,
                  ),
              ),
              // Contact Info
              SizedBox(height: 20),
              //email button
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    final Uri emailUri = Uri(
                      scheme: 'mailto',
                      path: 'a.abdelmoumane@yahoo.com',
                      query: 'subject=Hello&body=Hi Abdelmoumane',
                    );
                    lunchUri(emailUri);
                  }, 
                  child: Row(
                    children: [
                      Icon(Icons.email, size: 30,color: Colors.blueGrey,),
                      SizedBox(width: 10),
                      Text('a.abdelmoumane@yahoo.com',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  )
                ),
              ),
              SizedBox(height: 20,),
              //phone button
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    final Uri emailUri = Uri(
                      scheme: 'tel',
                      path: '+213792744430',
                    );
                    lunchUri(emailUri);
                  }, 
                  child: Row(
                    children: [
                      Icon(Icons.phone, size: 30,color: Colors.blueGrey,),
                      SizedBox(width: 10),
                      Text('+213792744430',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  )
                ),
              ),
              SizedBox(height: 20,),
              //IG button
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    final Uri instauri= Uri.parse('https://www.instagram.com/s.holmes_110918?jigsh=MW13NWw1OWh2anN1Mg==');
                    lunchUri(instauri);
                  }, 
                  child: Row(
                    children: [
                       Image.asset("assets/insta.png",
                         width: 30,
                         height: 30,
                       ),
                      SizedBox(width: 10),
                      Text('abdelmoumane_arros',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  )
                ),
              ),
            ],
          )
        ),
      )
    );
  }
}