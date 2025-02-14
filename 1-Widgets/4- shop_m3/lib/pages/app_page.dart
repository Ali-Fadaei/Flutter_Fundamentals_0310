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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          selectedIndex = value;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: 'Store',
            backgroundColor: Colors.blueGrey,
            icon: Icon(
              Icons.store,
              color: Colors.cyan,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Category',
            backgroundColor: Colors.blueGrey,
            icon: Icon(
              Icons.category_rounded,
              color: Colors.cyan,
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
