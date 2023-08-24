import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesplace/controllers/mainscreen_provider.dart';
import 'package:shoesplace/views/shared/bottom_nav.dart';
import 'package:shoesplace/views/ui/cartpage.dart';
import 'package:shoesplace/views/ui/homepage.dart';

import 'profile.dart';
import 'searchpage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pageList = [
    const HomePage(),
    const SearchPage(),
    const HomePage(),
    CartPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFE2E2E2),
          body: pageList[mainScreenNotifier.pageIndex],
          bottomNavigationBar: const BottoNavBar(),
        );
      },
    );
  }
}
