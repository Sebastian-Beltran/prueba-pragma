import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_pragma/core/state/custom_state.dart';
import 'package:prueba_pragma/features/home/provider/home_provider.dart';
import 'package:prueba_pragma/features/home/ui/widgets/custom_app_bar.dart';
import 'package:prueba_pragma/features/home/ui/widgets/list_cats_widget.dart';

final searchQueryProvider = StateProvider.autoDispose<String>((ref) => '');

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeProvider.notifier).getCatList();
    });

    _searchController.addListener(() {
      _debounce?.cancel();

      _debounce = Timer(const Duration(milliseconds: 300), () {
        ref.read(searchQueryProvider.notifier).state = _searchController.text;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeProvider);
    final searchQuery = ref.watch(searchQueryProvider);

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: state.cats.whenDataOrFailure(
          failure: (e) => SizedBox(
            child: Text(e),
          ),
          data: (cats) {
            final filteredCats = cats.where((cat) {
              return cat.name.toLowerCase().contains(searchQuery.toLowerCase());
            }).toList();

            return Column(
              children: [
                const SizedBox(height: 30),
                Theme(
                  data: Theme.of(context).copyWith(primaryColor: Colors.green),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Buscar gato...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: const Icon(Icons.search),
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 6.0, top: 8.0),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                if (filteredCats.isEmpty)
                  const Text('No se han encontrado coincidencias'),
                ListCatsWidget(cats: filteredCats),
              ],
            );
          },
        ),
      ),
    );
  }
}
