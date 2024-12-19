// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/controll/shop_app_cubit/shop_app_cubit.dart';
import 'package:shop_app/shared_in_app/custom_widgets/vhSpace.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopAppCubit.get(context);
        var model = cubit.categoriesModel;
        return ListView.builder(
            itemBuilder: (context, index) => Container(
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
                          image: NetworkImage('${model!.data!.data[index].image}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    HSpace(width: 10),
                    Text(
                      '${model.data!.data[index].name}',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                    ),
                  ]),
                ),
            itemCount: model!.data!.data.length);
      },
    );
  }
}
