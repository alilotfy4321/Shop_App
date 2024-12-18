import 'package:flutter/material.dart';
import 'package:shop_app/model/shop_home_model.dart';

import '../../../shared_in_app/custom_widgets/vhSpace.dart';

class CustomProductsGrid extends StatelessWidget {
  CustomProductsGrid(this.model,this.index, {Key? key}) : super(key: key);
  ShopHomeModel model;
  int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey[100],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //----------------------------------------1
              Container(
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    topRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      '${model.data!.products![index].image}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //VSpace(),
              //---------------------------------------------2
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  '${model.data!.products![index].name}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 14),
                ),
              ),

              //---------------------------------------------3
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    //-showd oldprice
                    if (model.data!.products![index].discount !=
                        0) //-showd oldprice or not
                      Text(
                        '${model.data!.products![index].oldPrice}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              fontSize: 12,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                      ),
                    HSpace(width: 5),
                    Text(
                      '${model.data!.products![index].price}',
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontSize: 14,
                                color: Colors.blue,
                              ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_outline_rounded),
              )),
        ),
        if (model.data!.products![index].discount != 0) //-showd offer or not
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  color: Colors.red,
                  child: const Text('offer'),
                ),
              )),
      ],
    );
  }
}
