import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_pragma/core/constants/color_constants.dart';
import 'package:prueba_pragma/core/state/custom_state.dart';
import 'package:prueba_pragma/features/home/models/cat_model.dart';
import 'package:prueba_pragma/features/home/provider/home_provider.dart';

class CardCatWidget extends ConsumerStatefulWidget {
  const CardCatWidget({required this.cat, super.key});
  final CatModel cat;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CardCatWidgetState();
}

class _CardCatWidgetState extends ConsumerState<CardCatWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(homeProvider.notifier).getImageCat(widget.cat.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final stateImg = ref.watch(homeProvider.select((v) => v.catImage));
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.cat.name,
                  style: TextStyle(color: ColorConstants.primary),
                ),
                Text(
                  'Más...',
                  style: TextStyle(color: ColorConstants.primary),
                )
              ],
            ),
            const SizedBox(height: 10),
            stateImg.whenDataOrFailure(
              failure: (failure) => Text(failure),
              data: (img) => Image.network(
                img.url,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: ColorConstants.red,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                        child: Text(
                      "Sssss",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.primary,
                        fontSize: 24,
                      ),
                    )),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.cat.countryOrigin,
                  style: TextStyle(color: ColorConstants.primary),
                ),
                Text(
                  widget.cat.inteligence.toString(),
                  style: TextStyle(color: ColorConstants.primary),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
