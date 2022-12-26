import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techpit_app/model/data/shop_item.dart';

class ItemGrid extends ConsumerWidget {
  const ItemGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ids = ref.watch(shopItemIdsForSelectedCategoryProvider);
    return ids.when(
      loading: () => const SliverToBoxAdapter(child: Text('loading')),
      error: (error, stack) => const SliverToBoxAdapter(child: Text('error')),
      data: (itemIds) => SliverPadding(
        padding: const EdgeInsets.all(8),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return _ItemCard(id: itemIds[index]);
            },
            childCount: itemIds.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
        ),
      ),
    );
  }
}

class _ItemCard extends ConsumerWidget {
  const _ItemCard({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(shopItemForIdProvider(id));
    return item.when(
      loading: () => const SliverToBoxAdapter(
        child: Text('loading'),
      ),
      error: (error, stack) => const SliverToBoxAdapter(
        child: Text('error'),
      ),
      data: (item) => Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width / 2 * 0.8,
            child: Card(
              clipBehavior: Clip.hardEdge,
              elevation: 4,
              child: Image.network(
                'https://images.unsplash.com/photo-1600185365926-3a2ce3cdb9eb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1625&q=80',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text(
              'Super shoes 1',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text(
              '12800yen',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
