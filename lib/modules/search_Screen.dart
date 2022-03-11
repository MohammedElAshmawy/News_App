
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components/components.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class search_Screen extends StatelessWidget {
  const search_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController=TextEditingController();

     var list =news_cubit.get(context).search;
    return BlocConsumer<news_cubit,news_States>(

      listener: (context,states){},
      builder: (context,states){
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: searchController,
                  validator: (value){
                    if(value!.isEmpty){
                      return('search must not be empty');
                    }
                  },
                  onChanged: (value)
                  {
                    news_cubit.get(context).getSearch(value);
                  },
                  decoration:InputDecoration(
                    label: Text('Search'),
                    prefix: Icon(Icons.search),
                  ),

                ),
              ),
              Expanded(child: articleBuilder(list, context)),
            ],
          ),
        );
      },
    );

  }
}
