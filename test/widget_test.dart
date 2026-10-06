import 'package:flutter_test/flutter_test.dart';

import 'package:firebase_series/models/user_model.dart';

void main() {
  test('UserModel converts to and from Firestore map correctly', () {
    final createdAt = DateTime(2025, 1, 2, 3, 4, 5);

    final model = UserModel(
      uid: 'abc123',
      name: 'Alice Johnson',
      email: 'alice@example.com',
      phone: '+1234567890',
      createdAt: createdAt,
    );

    final map = model.toMap();

    expect(map['name'], 'Alice Johnson');
    expect(map['email'], 'alice@example.com');
    expect(map['phone'], '+1234567890');
    expect(map['createdAt'], createdAt.toIso8601String());

    final restored = UserModel.fromMap(map, 'abc123');
    expect(restored.uid, 'abc123');
    expect(restored.name, 'Alice Johnson');
    expect(restored.email, 'alice@example.com');
    expect(restored.phone, '+1234567890');
  });
}
