import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget {
  const ImageDetail({required this.imgPath, super.key});

  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        child: Image.network(
          width: 250,
          height: 250,
          fit: BoxFit.fitHeight,
          imgPath,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.white,
              child: Column(
                children: [
                  Image.asset('assets/img/cat.png'),
                  const Text('Imagen no encontrada'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
