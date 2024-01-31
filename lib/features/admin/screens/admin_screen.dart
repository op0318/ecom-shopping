import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/admin/screens/post_screen.dart';
import 'package:flutter/material.dart';

import '../../account/screens/account_screen.dart';
import '../../home/screens/home_screen.dart';
import 'package:badges/badges.dart' as badge;

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomBarWidth = 40;
  double bottomBarBorderWidth = 5;

  void UpdatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    const PostScreen(),
    const Center(child: Text('Analytics page')),
    const Center(
      child: Text('Cart Page'),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Center(
                      child: Image.asset(
                        'assets/images/amazon_in.png',
                        height: 45,
                        width: 120,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Text('admin',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold))
              ],
            ),
          )),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: UpdatePage,
        items: [
          //Posts
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            width: bottomBarBorderWidth,
                            color: _page == 0
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor))),
                child: Icon(Icons.home_outlined),
              ),
              label: ''),
          //Analytics
          BottomNavigationBarItem(
              icon: Container(
                child: Icon(Icons.analytics_outlined),
                width: bottomBarWidth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            width: bottomBarBorderWidth,
                            color: _page == 1
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor))),
              ),
              label: ''),
          //inbox
          BottomNavigationBarItem(
              icon: Container(
                child: Icon(Icons.all_inbox_outlined),
                width: bottomBarWidth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            width: bottomBarBorderWidth,
                            color: _page == 2
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor))),
              ),
              label: '')
        ],
      ),
    );
  }
}
