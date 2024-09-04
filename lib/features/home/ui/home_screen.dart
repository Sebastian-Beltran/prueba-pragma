import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_pragma/core/constants/color_constants.dart';
import 'package:prueba_pragma/features/home/ui/widgets/custom_app_bar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   ref
    //       .read(homeProvider.notifier)
    //       .getInformationUser(userId: Constants.userId);
    // });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final state = ref.watch(homeProvider);
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Text('APPPP'),
    );
    // body: SingleChildScrollView(
    //   child: Padding(
    //     padding: const EdgeInsets.all(20.0),
    //     child: state.userHealth.whenDataOrFailure(
    //       failure: (e) => SizedBox(
    //         child: Text(e),
    //       ),
    //       data: (userHealth) => Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           const SizedBox(height: 30),
    //           Text.rich(
    //             TextSpan(
    //               children: [
    //                 const TextSpan(
    //                     text: 'Hi, ',
    //                     style: TextStyle(
    //                       fontSize: 24,
    //                     )),
    //                 TextSpan(
    //                   text: userHealth.name,
    //                   style: const TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 24,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           const Text(
    //             'Your goal is on its way to you!',
    //             style: TextStyle(fontSize: 14),
    //           ),
    //           const SizedBox(height: 30),
    //           const SizedBox(height: 10),
    //         ],
    //       ),
    //     ),
    //   ),
    // ));
  }

  void onPressed({
    required BuildContext context,
  }) {}
}
