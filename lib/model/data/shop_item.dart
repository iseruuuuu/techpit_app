import 'dart:convert' show jsonDecode;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techpit_app/model/data/item/item.dart';

final shopItemProvider = FutureProvider((ref) async {
  final data = await rootBundle.loadString('assets/mock.json');
  //jsonは、String型をDecodeして、List型にする（List<???>だから、List<Map<String,dynamic>に変換する）
  final json = (await jsonDecode(data) as List).cast<Map<String, dynamic>>();
  final items = json.map(Item.fromJson).toList();
  return items;
});

// final shopItemIdsProvider = Provider((ref) {
//   final AsyncValue<List<Item>> items = ref.watch(shopItemProvider);
//   return items.whenData((items) => items.map((item) => item.id).toList());
// });
