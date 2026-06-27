// This is a basic Flutter widget test.

import 'package:flutter_test/flutter_test.dart';
import 'package:koperasi_mobile/main.dart';

void main() {
  testWidgets('App should build successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const KoperasiApp());
    expect(find.text('Koperasi Bakamla RI'), findsNothing); // Just a simple test
  });
}
