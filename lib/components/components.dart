

import 'dart:ffi';

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/webViewScreen.dart';

Widget buildArticleItem(article,context) => Padding(



  padding: const EdgeInsets.all(20.0),



  child: Row(



    children: [



      Container(



        width: 100,



        height: 100,



        decoration: BoxDecoration(



          borderRadius:BorderRadius.circular(20),



          image: DecorationImage(



            image: NetworkImage('${article['urlToImage']}'),



            fit: BoxFit.cover,



          ),



        ),



      ),



      SizedBox(width: 20,),



      Expanded(



        child: Container(



          height: 120,



          child: Column(



            mainAxisAlignment: MainAxisAlignment.start,



            crossAxisAlignment: CrossAxisAlignment.start,



            mainAxisSize: MainAxisSize.min,



            children: [



              Expanded(



                child:



                Text('${article['title']}',



                  style: Theme.of(context).textTheme.bodyText1,



                  maxLines: 4,



                  overflow: TextOverflow.ellipsis,



                ),



              ),



              SizedBox(height: .1,),



              Text('${article['publishedAt']}',



                style: TextStyle(



                    color: Colors.grey



                ),



              ),



            ],



          ),



        ),



      ),



    ],



  ),



);

Widget myDivider()=>Container(
  width: double.infinity,
  height: 1,
  color: Colors.grey[300],
);

Widget articleBuilder(list,context)=>ConditionalBuilder(
    condition:list.length>0,
    builder:(context)=>ListView.separated(
      itemBuilder:(context,index)=>buildArticleItem(list[index],context),
      separatorBuilder:(context,index)=>myDivider(),
      itemCount: list.length,
    ),
    fallback:(context)=>Center(child: CircularProgressIndicator())


);

void navigateTo (context,widget)=>
    Navigator.push(context
        , MaterialPageRoute(
   builder:(context)=>widget(
  ),

  ));

Widget defaultFormField({

  required TextEditingController controller,
  required TextInputType type,

  bool isPassword = false,
  required Function validate,
  required String label,
  required IconData prefix,


  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      validator: validate(),

    );
