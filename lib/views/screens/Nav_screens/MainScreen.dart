import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartwala/views/screens/Nav_screens/Cart_Screen.dart';
import 'package:kartwala/views/screens/Nav_screens/Profile_Screen.dart';
import 'package:kartwala/views/screens/Nav_screens/Stores_Screen.dart';
import 'package:kartwala/views/screens/Nav_screens/category_screen.dart';
import 'package:kartwala/views/screens/Nav_screens/favourite_screen.dart';
import 'package:kartwala/views/screens/Nav_screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;

  final pages = [
    const HomeScreen(),
    const CategoryScreen(),
    const FavouriteScreen(),
    const StoresScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: pages[pageIndex],
    );
  }
}
