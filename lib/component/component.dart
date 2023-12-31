import 'package:flutter/material.dart';
import 'package:my_flutter_app/cubit/app_cubit.dart';

import '../modules/web_view_screen.dart';

Widget buildNewsItem (List list){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView.separated(
      itemBuilder: (context, index) {
        return InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  WebViewScreen(list[index]['link']))),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: NetworkImage(
                        list[index]['image_url']??'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                          list[index]['title'],
                          style: AppCubit.get(context).myTextStyle,
                          maxLines: 3,
                        )),
                    Text(list[index]['pubDate'],style: TextStyle(color: Colors.grey),),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
        },
      itemCount: list.length,
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey,
        ),
      ),
    ),
  );
}