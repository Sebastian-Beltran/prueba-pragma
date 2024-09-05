import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_pragma/features/home/ui/widgets/custom_app_bar.dart';

void main() {
  group('Testing Custom AppBar', () {
    testWidgets('Find Test in AppBar', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: CustomAppBar(),
          ),
        ),
      );

      final titleTextFromField = find.text('Catbreeds');
      expect(titleTextFromField, findsOneWidget);
    });
  });
}
