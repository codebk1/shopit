import 'package:flutter_test/flutter_test.dart';

import 'package:shopit/src/features/features.dart';

void main() {
  group('User', () {
    test('supports value equality', () {
      const user1 = User(id: '1', email: 'test1@test.com');
      const secondUser1 = User(id: '1', email: 'test1@test.com');
      const user2 = User(id: '2', email: 'test2@test.com');

      expect(user1, equals(secondUser1));
      expect(user1, isNot(equals(user2)));
    });
  });
}
