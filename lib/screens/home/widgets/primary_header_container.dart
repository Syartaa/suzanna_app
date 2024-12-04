import 'package:flutter/material.dart';
import 'package:suzanne_app/components/containers/circular_container.dart';
import 'package:suzanne_app/components/containers/curved_edges_widget.dart';
import 'package:suzanne_app/utilis/constants/colors.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer(
      {super.key, required this.child, this.height = 380});

  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child: Container(
        color: const Color(0xFFDA90A4),
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -260,
                child: CircularContainer(
                  backgroundColor: SColor.textWhite.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: CircularContainer(
                  backgroundColor: SColor.textWhite.withOpacity(0.1),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
