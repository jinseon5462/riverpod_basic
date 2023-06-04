import 'package:flutter_riverpod/flutter_riverpod.dart';

final familyModifierProvider = FutureProvider.family<List<int>, int>((ref, data) {
  Future.delayed(Duration(seconds: 2));

  return List.generate(5, (index) => index * data);
});
