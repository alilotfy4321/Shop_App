// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shop_app/model/shop_categories_model.dart';

// ignore: camel_case_types
class RowCategoryItem extends StatelessWidget {
  RowCategoryItem(this.categoryModel,this.index, {Key? key}) : super(key: key);
  ShopCategoriesModel categoryModel;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.all(5),
      height: 120.0,
      width: 120.0,
      child: Stack(
        children: [
          Image.network(
            '${categoryModel.data!.data[index].image}',
            height: 120,
            width: 120,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Opacity(
              opacity: 0.6,
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: Center(
                    child: Text(
                  '${categoryModel.data!.data[index].name}',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.white, fontSize: 14),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
