import 'package:flutter/material.dart';

Widget ListWidget(String url,String first,String secound)
{
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5),
    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: Colors.black26
            )
        )
    ),

    child: Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.network(url,gaplessPlayback: true,height: 50,width: 50,)),
        SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(first),
            SizedBox(height: 5,),
            Text(secound),
          ],
        )
      ],
    ),
  );
}