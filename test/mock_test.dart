import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

// Real class
class Cat {
  String sound() => "Meow";
  bool eatFood(String food, {bool hungry}) => true;
  Future<void> chew() async => print("Chewing...");
  int walk(List<String> places) => 7;
  void sleep() {}
  void hunt(String place, String prey) {}
  int lives = 9;
}

// Mock class
class MockCat extends Mock implements Cat {}

main() {
  group('Save State Middleware', () {
    test('description', () {
      var cat = MockCat();
      when(cat.sound()).thenReturn("Purr");
      expect(cat.sound(), "Purr");
    });
  });
  // Create mock object.
}
