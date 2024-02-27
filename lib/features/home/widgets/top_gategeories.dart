import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/home/screens/categeory_deals.dart';
import 'package:flutter/material.dart';

class TopCategeories extends StatelessWidget {
  const TopCategeories({Key? key}) : super(key: key);
  void NavigateToCategeoryPage(BuildContext context, String category) {
    Navigator.pushNamed(context, CategeoryDealsScreen.routName,
        arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemExtent: 75,
        scrollDirection: Axis.horizontal,
        itemCount: GlobalVariables.categoryImages.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () => NavigateToCategeoryPage(
                    context, GlobalVariables.categoryImages[index]['title']!),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      GlobalVariables.categoryImages[index]['image']!,
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
              ),
              Text(GlobalVariables.categoryImages[index]['title']!)
            ],
          );
        },
      ),
    );
  }
}
