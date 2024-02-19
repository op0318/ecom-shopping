import 'package:amazon_clone/constants/loader.dart';
import 'package:amazon_clone/features/admin/screens/add_screen.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:flutter/material.dart';

import '../../../model/product.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Product>? products;
  final adminServeice = AdminService();

  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

  void getAllProducts() async {
    products = await adminServeice.fetchAllProducts(context);
    setState(() {});
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  Widget build(BuildContext context) {
    return products == null
        ? Loader()
        : Scaffold(
            body: Center(
              child: products == null
                  ? Text('There has not new products')
                  : Text('Products to show or add new'),
            ),
            floatingActionButton: FloatingActionButton(
              tooltip: 'Add a product',
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              backgroundColor: Colors.cyan,
              onPressed: navigateToAddProduct,
              child: Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
