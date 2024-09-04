import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_pragma/features/home/models/cat_model.dart';
import 'package:prueba_pragma/features/home/ui/widgets/card_cat_widget.dart';

class ListCatsWidget extends ConsumerStatefulWidget {
  const ListCatsWidget({
    required this.cats,
    super.key,
  });

  final List<CatModel> cats;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListCatsWidgetState();
}

class _ListCatsWidgetState extends ConsumerState<ListCatsWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: widget.cats.length,
          itemBuilder: (context, index) {
            return CardCatWidget(cat: widget.cats[index]);
          }),
    );
  }
}
