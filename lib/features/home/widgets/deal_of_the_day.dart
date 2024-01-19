import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10,top: 15),
          child: const Text('Deal of the day',style: TextStyle(
            fontSize: 20
          )),
        ),
        Image.network('https://www.apple.com/newsroom/images/product/mac/standard/Apple_16-inch-MacBook-Pro_111319_big.jpg.large.jpg',
          height: 235,
          fit: BoxFit.fitHeight,),
        Container(
          padding: EdgeInsets.only(left: 15),
          alignment: Alignment.topLeft,
          child:const  Text('\$100'),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding:const EdgeInsets.only(left: 15,top: 5,right: 40),
          child: const Text('Thirumoorthi',maxLines: 2,
          overflow: TextOverflow.ellipsis,),
        ),

        Row(
          children: [
            Image.network('https://m.media-amazon.com/images/I/71eXNIDUGjL._SL1500_.jpg'),
            Image.network('https://m.media-amazon.com/images/I/610TpF8jQyL._SL1500_.jpg'),
            Image.network('https://m.media-amazon.com/images/I/81v8DvchdSL._SL1500_.jpg'),
            Image.network('https://m.media-amazon.com/images/I/61pRKAL2DPL._SL1500_.jpg')
            
          ],
        )
      ],
    );
  }
}
