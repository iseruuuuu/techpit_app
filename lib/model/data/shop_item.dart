import 'dart:convert' show jsonDecode;

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:techpit_app/model/category.dart';
import 'package:techpit_app/model/data/item/item.dart';

final shopItemProvider = FutureProvider((ref) async {
  //TODO errorになっちゃう
  final result = await Client().get(Uri.parse(
      'https://run.mocky.io/v3/241a87d2-445d-4cd6-bde3-77610247c18a'));
  final json = (jsonDecode(result.body) as List).cast<Map<String, dynamic>>();
  final items = json.map(Item.fromJson).toList();
  return items;
});

final shopItemIdsForSelectedCategoryProvider = Provider((ref) {
  final AsyncValue<List<Item>> items = ref.watch(shopItemProvider);
  final selectedCategory = ref.watch(selectedCategoryProvider);
  return items.whenData(
    (items) => items
        .where((item) => item.category == selectedCategory)
        .map((item) => item.id)
        .toList(),
  );
});

final shopItemForIdProvider = Provider.family((ref, String id) {
  final AsyncValue<List<Item>> items = ref.watch(shopItemProvider);
  return items.whenData(
    (items) => items.firstWhere((item) => item.id == id),
  );
});
