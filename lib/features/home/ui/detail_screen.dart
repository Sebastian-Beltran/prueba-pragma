import 'package:flutter/material.dart';
import 'package:prueba_pragma/features/home/models/cat.dart';
import 'package:prueba_pragma/features/home/ui/widgets/card_detail_info.dart';
import 'package:prueba_pragma/features/home/ui/widgets/custom_app_bar.dart';
import 'package:prueba_pragma/features/home/ui/widgets/image_detail.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Cat cat = ModalRoute.of(context)!.settings.arguments as Cat;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 20),
          ImageDetail(imgPath: cat.imgPath),
          const Spacer(),
          CardDetailInfo(cat: cat),
        ],
      ),
    );
  }

  void onPress() {}
}
