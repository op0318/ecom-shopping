import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/screens/account_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge ;


class BottomBar extends StatefulWidget {
  static const String routeName='/actual/home';
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page=0;
  double bottomBarWidth=40;
  double bottomBarBorderWidth=5;

  List<Widget> pages=[
    const HomeScreen(),
    const AccountScreen(),
    const Center(child: Text('Cart Page'),)

  ];



void UpdatePage(int page)
{
 setState(() {
   _page=page;
 });
}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: pages[_page],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
                onTap:UpdatePage ,

                items: [
          //Home
          BottomNavigationBarItem(
              icon: Container(


            width:bottomBarWidth ,
            decoration: BoxDecoration(

              border: Border(
                  top: BorderSide(
                  width: bottomBarBorderWidth,
                    color: _page==0?GlobalVariables.selectedNavBarColor:
                GlobalVariables.backgroundColor)
              )
            ),
                child: Icon(Icons.home_outlined),
          ),
            label: ''
          ),
          //Account//Profile
          BottomNavigationBarItem(
              icon: Container(
                child: Icon(Icons.person_outline_outlined),
                width:bottomBarWidth ,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            width: bottomBarBorderWidth,
                            color: _page==1?GlobalVariables.selectedNavBarColor:
                            GlobalVariables.backgroundColor)
                    )
                ),
              ),
          label: ''),
          //cart
          BottomNavigationBarItem(
              icon: Container(

                child: badge.Badge(
                  elevation: 0,
                  badgeColor: Colors.white,
                  badgeContent: const Text('2'),
                    child: Icon(Icons.shopping_cart_outlined)),
                width:bottomBarWidth ,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            width: bottomBarBorderWidth,
                            color: _page==2?GlobalVariables.selectedNavBarColor:
                            GlobalVariables.backgroundColor)
                    )
                ),
              ),
              label: '')

        ],
      ),
    );
  }
}
