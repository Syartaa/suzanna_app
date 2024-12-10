import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  final String imagePath, buttonTitle;
  final String title;
  final VoidCallback onListenNowPressed;
  final Color textColor, buttonColor;

  const PromoBanner({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.onListenNowPressed,
    required this.buttonTitle,
    this.textColor = Colors.white,
    this.buttonColor = Colors.amber,
  }) : super(key: key);

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
                child: Image.asset(imagePath,
                    fit: BoxFit.cover), // Use dynamic image path
              ),
            ),
            Positioned(
              right: 150,
              top: 80,
              child: Text(
                title, // Use dynamic title
                style: TextStyle(
                    color: textColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Positioned(
              left: 200,
              top: 160,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: buttonColor),
                ),
                onPressed: onListenNowPressed, // Use dynamic callback
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    buttonTitle,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 248, 172, 57),
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
