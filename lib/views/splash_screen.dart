import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: SizedBox(
                  width: size.width * 0.6,
                  child:
                      SizedBox(child: Image.asset('assets/images/logo.png'))),
            ),
            Center(
                child: SizedBox(
                    width: size.width * 0.6,
                    child: Image.asset('assets/images/portal.png'))),
            Text("Sobre",
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(fontWeight: FontWeight.bold))),
            SizedBox(
              width: size.width * 0.6,
              child: Text(
                "A API Rick and Morty, é uma API REST e GraphQL baseada no programa de televisão Rick and Morty",
                style: GoogleFonts.roboto(textStyle: const TextStyle()),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width * 0.6,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      Navigator.pushNamed(context, '/homepage');
                    },
                    child: const Text(
                      "Pular",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
