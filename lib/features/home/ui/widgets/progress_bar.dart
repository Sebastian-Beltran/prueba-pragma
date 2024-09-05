import 'package:flutter/material.dart';
import 'package:prueba_pragma/core/constants/color_constants.dart';

class ProgressBar extends StatelessWidget {
  final int currentStep;
  final int totalSteps = 5;

  const ProgressBar({
    required this.currentStep,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double progress = currentStep / totalSteps;

    return Container(
      width: 100,
      height: 10,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[300],
            ),
            width: double.infinity,
            height: 10,
          ),
          Positioned(
            left: 0,
            right: (1 - progress) * 100,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorConstants.primary,
              ),
              height: 10,
            ),
          ),
        ],
      ),
    );
  }
}
