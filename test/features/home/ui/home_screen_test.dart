import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_pragma/features/home/ui/home_screen.dart';

void main() {
  group('Testing home Screen', () {
    testWidgets('Find Test in TexFormField', (tester) async {
      await tester.pumpWidget(const HomeScreen());

      final titleTextFromField = find.text('Buscar gato...');
      expect(titleTextFromField, findsOneWidget);
    });
  });
}
