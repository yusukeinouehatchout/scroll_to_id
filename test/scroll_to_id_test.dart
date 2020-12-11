import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scroll_to_id/scroll_to_id.dart';

void main() {
  const MethodChannel channel = MethodChannel('scroll_to_id');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await ScrollToId.platformVersion, '42');
  });
}
