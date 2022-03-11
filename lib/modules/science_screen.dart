
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components/components.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class science_Screen extends StatelessWidget {
  const science_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<news_cubit,news_States>(
      listener:(context,state){},
      builder:(context,state){

        var list=news_cubit.get(context).science;

        return articleBuilder(list,context);
      },

    );

  }
}
