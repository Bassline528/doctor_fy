import 'package:flutter_test/flutter_test.dart';
import 'package:doctor_fy/app/app.dart';
import 'package:doctor_fy/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
