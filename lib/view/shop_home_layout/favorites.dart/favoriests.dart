// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/controll/shop_app_cubit/shop_app_cubit.dart';
import 'package:shop_app/shared_in_app/custom_widgets/vhSpace.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopAppCubit.get(context);
        var favorateList = cubit.getFavorites!.data!.data;
        return ListView.builder(
            itemBuilder: (context, index) => ConditionalBuilder(
                condition: state is! ShopAppGetFavoritesLoadingState,
                builder: (conext) => Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.blueGrey,
                            offset: Offset(2, 2),
                          ),
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(2, 2),
                          ),
                        ],
                        color: Colors.teal[50],
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(
                                  '${favorateList![index].product!.image!}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        HSpace(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                //-showd oldprice
                                if (favorateList[index].product!.discount !=
                                    0) //-showd oldprice or not
                                  Text(
                                    '${favorateList[index].product!.oldPrice}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                          fontSize: 12,
                                          color: Colors.grey,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                  ),
                                HSpace(width: 5),
                                Text(
                                  '${favorateList[index].product!.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        fontSize: 14,
                                        color: Colors.blue,
                                      ),
                                ),
                              ],
                            ),
                            VSpace(height: 10),
                            Row(
                              children: [
                                Container(
                                  width: 130,
                                  child: Text(
                                    '${favorateList[index].product!.name}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                HSpace(width: 20),
                                IconButton(
                                  onPressed: () {
                                    //print(model.data!.products![index].id);
                                    cubit.changeFavoriteItems(
                                        favorateList[index].product!.id);
                                  },
                                  icon: CircleAvatar(
                                    backgroundColor: (cubit.favorites[
                                            favorateList[index].product!.id]!)
                                        ? Colors.red
                                        : Colors.grey,
                                    radius: 15.0,
                                    child: Icon(
                                      Icons.favorite_outline_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]),
                    ),
                fallback: (context) => CircularProgressIndicator()),
            itemCount: favorateList!.length);
      },
    );
  }
}
