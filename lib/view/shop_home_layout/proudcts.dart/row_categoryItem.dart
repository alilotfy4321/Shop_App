// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: camel_case_types
class RowCategoryItem extends StatelessWidget {
  const RowCategoryItem({Key? key}) : super(key: key);

  


  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.all(5),
              height: 120.0,
              width: 120.0,
              child: Stack(
                children: [
              Image.asset('assets/images/Capture1.PNG',height: 120,width: 120,fit: BoxFit.cover,),
              Align(
                alignment: Alignment.bottomCenter,
                child: Opacity(
                  opacity: 0.6,
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color:  Colors.black,
                    ),
                    child: Center(child: Text('اجهزه الكترونيه',style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white,fontSize: 14),)),
                  ),
                ),
              ),
              ],),
             
            );
  }
}