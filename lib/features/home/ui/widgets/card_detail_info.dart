import 'package:flutter/material.dart';
import 'package:prueba_pragma/core/constants/color_constants.dart';
import 'package:prueba_pragma/features/home/models/cat.dart';
import 'package:prueba_pragma/features/home/ui/widgets/progress_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class CardDetailInfo extends StatelessWidget {
  const CardDetailInfo({required this.cat, super.key});

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: size * 0.5,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cat.name,
                  style: TextStyle(
                    color: ColorConstants.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Icon(
                  Icons.pets,
                  size: 30,
                  color: ColorConstants.primary,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Icon(
                  Icons.location_pin,
                  color: ColorConstants.primary,
                ),
                Text(
                  'Origin Country: ${cat.countryOrigin}',
                  style: TextStyle(
                    color: ColorConstants.primary,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Adaptability:',
                      style: TextStyle(
                        color: ColorConstants.primary,
                        fontSize: 18,
                      ),
                    ),
                    ProgressBar(
                      currentStep: cat.adaptability,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Intelligence:',
                      style: TextStyle(
                        color: ColorConstants.primary,
                        fontSize: 18,
                      ),
                    ),
                    ProgressBar(
                      currentStep: cat.inteligence,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dog Friendly:',
                      style: TextStyle(
                        color: ColorConstants.primary,
                        fontSize: 18,
                      ),
                    ),
                    ProgressBar(
                      currentStep: cat.dogFrendly,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Affection:',
                      style: TextStyle(
                        color: ColorConstants.primary,
                        fontSize: 18,
                      ),
                    ),
                    ProgressBar(
                      currentStep: cat.affection,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Life span years:',
                  style: TextStyle(
                    color: ColorConstants.primary,
                    fontSize: 18,
                  ),
                ),
                Text(
                  cat.lifeSpan,
                  style: TextStyle(
                    color: ColorConstants.primary,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: TextStyle(
                    color: ColorConstants.primary,
                    fontSize: 18,
                  ),
                ),
                Text(
                  cat.description,
                  style: TextStyle(
                    color: ColorConstants.primary,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (cat.urlInfo != null)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.primary,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => launchUrl(Uri.parse(cat.urlInfo!)),
                child: const Text('Ver mas información'),
              )
          ],
        ),
      ),
    );
  }
}
