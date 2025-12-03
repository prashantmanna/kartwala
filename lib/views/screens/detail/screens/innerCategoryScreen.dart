import 'package:flutter/material.dart';

import 'package:kartwala/models/category.dart';

import 'package:kartwala/views/screens/Nav_screens/Cart_Screen.dart';
import 'package:kartwala/views/screens/Nav_screens/Profile_Screen.dart';
import 'package:kartwala/views/screens/Nav_screens/Stores_Screen.dart';

import 'package:kartwala/views/screens/Nav_screens/category_screen.dart';
import 'package:kartwala/views/screens/Nav_screens/favourite_screen.dart';

import 'package:kartwala/views/screens/detail/screens/screens/innerCategoryContent.dart';

class Innercategoryscreen extends StatefulWidget {
  final Category category;

  const Innercategoryscreen({super.key, required this.category});

  @override
  State<Innercategoryscreen> createState() => _InnercategoryscreenState();
}

class _InnercategoryscreenState extends State<Innercategoryscreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final pages = [
      Innercategorycontent(category: widget.category),
      const CategoryScreen(),
      const FavouriteScreen(),
      const StoresScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        currentIndex: pageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home.png', width: 25),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/love.png', width: 25),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/mart.png', width: 25),
            label: 'Stores',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/cart.png', width: 25),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/user.png', width: 25),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
