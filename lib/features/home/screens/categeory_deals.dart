import 'package:amazon_clone/constants/loader.dart';
import 'package:amazon_clone/features/home/services/home_services.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';
import '../../../model/product.dart';

class CategeoryDealsScreen extends StatefulWidget {
  static const String routName = '/categeory-deals';
  final String Categeory;

  const CategeoryDealsScreen({Key? key, required this.Categeory})
      : super(key: key);

  @override
  State<CategeoryDealsScreen> createState() => _CategeoryDealsScreenState();
}

class _CategeoryDealsScreenState extends State<CategeoryDealsScreen> {
  HomeService services = HomeService();
  List<Product>? productList;

  void initState() {
    super.initState();
    fetchCategeoryProducts();
  }

  void fetchCategeoryProducts() async {
    productList = await services.fetchCategeoryWiseProducts(
        context: context, Categeory: widget.Categeory);
    setState(() {});
  }

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
            title: Text(widget.Categeory,
                style: const TextStyle(color: Colors.black)),
          )),
      body: productList == null
          ? Loader()
          : Column(children: [
              SizedBox(
                child: Container(
                  height: 170,
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.only(left: 15),
                    itemCount: productList!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.4,
                        mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      final product = productList![index];
                      return Column(
                        children: [
                          SizedBox(
                            height: 130,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black12, width: 0.5)
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.network(product.images[0])),
                            ),
                          ),


                          Container(
                            alignment: Alignment.topLeft,
                            padding:const  EdgeInsets.only(left: 0,right: 15,top: 5),
                            child: Text(product.name,maxLines: 1,overflow:TextOverflow.ellipsis),
                          )
                        ],
                      );
                    },
                  ),
                ),
              )
            ]),
    );
  }
}
