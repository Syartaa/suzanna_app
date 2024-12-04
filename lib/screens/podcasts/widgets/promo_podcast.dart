// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PromoPodcast extends StatelessWidget {
  const PromoPodcast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(30)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child:
                    Image(image: AssetImage('assets/images/promo/promo.jpg')),
              ),
            ),
            Positioned(
              right: 150,
              top: 80,
              child: Text(
                "Podcast House",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            Positioned(
              left: 200,
              top: 160,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side:
                          BorderSide(color: Color.fromARGB(255, 245, 203, 89))),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Listen Now",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 248, 172, 57),
                          fontSize: 15),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
