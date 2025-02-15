import 'package:flutter/material.dart';
import 'package:shop_m3/pages/category/category_page.dart';
import 'package:shop_m3/pages/store/store_page.dart';

class AppPage extends StatefulWidget {
  //
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  //
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
        title: Image.asset(
          'assets/logos/Amazon.png',
        ),
      ),
      drawer: Container(
        color: Colors.white,
        height: double.infinity,
        width: 200,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) {
          selectedIndex = value;
          setState(() {});
        },
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: [
          NavigationDestination(
            label: 'Store',
            icon: Icon(
              Icons.store,
            ),
          ),
          NavigationDestination(
            label: 'Category',
            icon: Icon(
              Icons.category_rounded,
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: [
          StorePage(),
          CategoryPage(),
        ],
      ),
    );
  }
}
