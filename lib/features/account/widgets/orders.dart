import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/widgets/single_product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  //temproary
List list=[
  'https://www.cnet.com/a/img/resize/2f2304c5d81eb5cec022a982f11b79916ebc6c8b/hub/2023/03/15/6f49f5b8-3d61-4e48-8aaa-3572f2b9c854/macbook-air-m1-gold.png?auto=webp&fit=crop&height=675&width=1200',
  'https://www.cnet.com/a/img/resize/2f2304c5d81eb5cec022a982f11b79916ebc6c8b/hub/2023/03/15/6f49f5b8-3d61-4e48-8aaa-3572f2b9c854/macbook-air-m1-gold.png?auto=webp&fit=crop&height=675&width=1200',
  'https://www.cnet.com/a/img/resize/2f2304c5d81eb5cec022a982f11b79916ebc6c8b/hub/2023/03/15/6f49f5b8-3d61-4e48-8aaa-3572f2b9c854/macbook-air-m1-gold.png?auto=webp&fit=crop&height=675&width=1200',
  'https://www.cnet.com/a/img/resize/2f2304c5d81eb5cec022a982f11b79916ebc6c8b/hub/2023/03/15/6f49f5b8-3d61-4e48-8aaa-3572f2b9c854/macbook-air-m1-gold.png?auto=webp&fit=crop&height=675&width=1200'
];



  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Container(
          padding: EdgeInsets.only(left: 15),
          child: const Text('Your orders',style: TextStyle(
              fontSize: 18,
            fontWeight: FontWeight.w600
              )),
        ),

          Container(
            padding: EdgeInsets.only(right: 15),
            child:  Text('See all',
                style: TextStyle(
                  color: GlobalVariables.selectedNavBarColor,
                fontSize: 18,
                fontWeight: FontWeight.w600
            ),
            ),
          )
          ]
          ,),
        Container(
          height: 200,
          padding: EdgeInsets.only(left: 10,top: 20,right: 0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:list.length,
            itemBuilder: (context, index) {
              return SingleProduct(image: list[index]);

              },
          ),
        )
      ],
    );
  }
}
