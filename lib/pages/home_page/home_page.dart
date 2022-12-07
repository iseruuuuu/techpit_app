import 'package:flutter/material.dart';
import 'package:techpit_app/pages/home_page/home_header.dart';
import 'package:techpit_app/pages/home_page/item_categories.dart';
import 'package:techpit_app/pages/home_page/item_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Techpot Sports'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: const CustomScrollView(
        slivers: [
          HomeHeader(),
          ItemCategories(),
          ItemGrid(),
        ],
      ),
    );
  }
}
