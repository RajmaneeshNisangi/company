import 'package:flutter_test/flutter_test.dart';

import 'package:company/routing/app_router.dart';

void main() {
  test('Router is configured', () {
    expect(appRouter, isNotNull);
  });
}
