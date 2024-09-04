import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_pragma/core/state/custom_state.dart';
import 'package:prueba_pragma/features/home/provider/home_provider.dart';
import 'package:prueba_pragma/features/home/ui/widgets/custom_app_bar.dart';
import 'package:prueba_pragma/features/home/ui/widgets/list_cats_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeProvider.notifier).getCatList();
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
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: state.cats.whenDataOrFailure(
              failure: (e) => SizedBox(
                    child: Text(e),
                  ),
              data: (cats) => Column(
                    children: [
                      const SizedBox(height: 30),
                      Container(
                        height: 30,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 30),
                      ListCatsWidget(cats: cats)
                    ],
                  )
              //   ],
              // ),
              ),
        ));
  }

  void onPressed({
    required BuildContext context,
  }) {}
}
