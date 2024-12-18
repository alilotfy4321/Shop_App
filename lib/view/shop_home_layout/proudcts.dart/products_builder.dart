// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shop_app/model/shop_categories_model.dart';
import 'package:shop_app/model/shop_home_model.dart';
import 'package:shop_app/shared_in_app/custom_widgets/vhSpace.dart';
import 'package:shop_app/view/shop_home_layout/proudcts.dart/carousal_slider.dart';
import 'package:shop_app/view/shop_home_layout/proudcts.dart/proudcts_grid.dart';
import 'package:shop_app/view/shop_home_layout/proudcts.dart/row_categoryItem.dart';

class ProductsBuilder extends StatelessWidget {
   ProductsBuilder(this.context,this.model,this.categoryModel,{Key? key}) : super(key: key);
  BuildContext context;
  ShopHomeModel model;
  ShopCategoriesModel categoryModel;

  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //----------slider
            CustomSlider(model),
            //  row category items----
            Text(
              'categories',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Container(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categoryModel.data!.data.length,
                itemBuilder: (context, index) => RowCategoryItem(categoryModel,index),
                separatorBuilder: (context, index) => HSpace(width: 10),
              ),
            ),

            Text(
              'Products',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            //---------------grid Items
            SizedBox(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2, // Number of columns
                  childAspectRatio: 1 / 1.5,
                ),

                itemCount:
                    model.data!.products!.length, // Total number of items

                itemBuilder: (BuildContext context, int index) {
                  return CustomProductsGrid(model, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  }

