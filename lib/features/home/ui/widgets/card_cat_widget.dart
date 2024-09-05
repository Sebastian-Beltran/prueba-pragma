import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_pragma/core/constants/color_constants.dart';
import 'package:prueba_pragma/core/state/custom_state.dart';
import 'package:prueba_pragma/features/home/models/cat.dart';
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeProvider);
    final cat = widget.cat;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/detail',
          arguments: Cat(
            name: cat.name,
            countryOrigin: cat.countryOrigin,
            inteligence: cat.inteligence,
            adaptability: cat.adaptability,
            lifeSpan: cat.lifeSpan,
            imgPath: state.catImages[cat.id]!.value!.url,
            urlInfo: cat.urlInfo,
            description: cat.description,
            affection: cat.affection,
            dogFrendly: cat.dogFrendly,
          ),
        );
      },
      child: Card(
        color: ColorConstants.secondary,
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cat.name,
                    style: TextStyle(
                      color: ColorConstants.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
              const SizedBox(height: 10),
              if (state.catImages[cat.id]?.isLoading ?? false)
                const CircularProgressIndicator()
              else if (state.catImages[cat.id]?.isError ?? false)
                const Text('Error al cargar imagen')
              else if (state.catImages[cat.id]?.isSuccess != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                      width: 300,
                      fit: BoxFit.fill,
                      state.catImages[cat.id]!.value!.url),
                )
              else
                const Placeholder(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cat.countryOrigin,
                    style: TextStyle(color: ColorConstants.primary),
                  ),
                  Row(
                    children: [
                      Text(
                        'Inteligencia: ',
                        style: TextStyle(
                          fontSize: 14,
                          color: ColorConstants.primary,
                        ),
                      ),
                      Text(
                        '${cat.inteligence.toString()}/5',
                        style: TextStyle(
                          fontSize: 14,
                          color: ColorConstants.primary,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
