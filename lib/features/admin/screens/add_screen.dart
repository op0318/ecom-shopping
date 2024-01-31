import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  String Categeory = 'Mobiles';

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  List<String> productCategeories = [
    'Mobiles',
    'Essesntials',
    'Appliances',
    'Books',
    'Fashion'
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
              centerTitle: true,
              flexibleSpace: Container(
                decoration:
                    BoxDecoration(gradient: GlobalVariables.appBarGradient),
              ),
              title: const Text('Add product'))),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                DottedBorder(
                  strokeCap: StrokeCap.round,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(20),
                  dashPattern: [15, 4],
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.folder_open,
                          size: 40,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Select Product Images',
                          style: TextStyle(
                              fontSize: 15, color: Colors.grey.shade400),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: productNameController,
                  hintext: 'ProductName',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    maxLines: 7,
                    controller: descriptionController,
                    hintext: 'Description'),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(controller: priceController, hintext: 'price'),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: quantityController, hintext: 'quantity'),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    icon: Icon(Icons.keyboard_arrow_down),
                    value: Categeory,
                    items: [
                      ...(productCategeories).map((e) {
                        return DropdownMenuItem(value: e, child: Text(e));
                      }).toList()
                    ],
                    onChanged: (value) {
                      setState(() {
                        Categeory = value!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButton(text: 'Sell', onTap: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
