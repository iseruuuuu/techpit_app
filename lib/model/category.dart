import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum ItemCategory {
  @JsonValue('shoes')
  shoes,
  @JsonValue('uniform')
  uniform,
  @JsonValue('jacket')
  jacket,
  @JsonValue('pants')
  pants,
  @JsonValue('grass')
  grass,
  @JsonValue('backpack')
  backpack,
}

final selectedCategoryProvider = StateProvider((ref) => ItemCategory.shoes);

final categoryIconPathMapProvider = Provider<Map<ItemCategory, String>>((ref) {
  return {
    ItemCategory.shoes: 'assets/icons/shoes.png',
    ItemCategory.uniform: 'assets/icons/uniform.png',
    ItemCategory.jacket: 'assets/icons/jacket.png',
    ItemCategory.pants: 'assets/icons/pants.png',
    ItemCategory.grass: 'assets/icons/grass.png',
    ItemCategory.backpack: 'assets/icons/backpack.png',
  };
});

final categoryIconPathProvider = Provider.family((ref, ItemCategory category) {
  return ref.watch(categoryIconPathMapProvider)[category] ?? '';
});
