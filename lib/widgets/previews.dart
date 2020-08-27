import 'package:flutter/material.dart';

import '../models/content_model.dart';

class Preview extends StatelessWidget {
  final String title;
  final List<Content> contentList;

  const Preview({Key key, this.title, this.contentList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 165,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: contentList.length,
            itemBuilder: (BuildContext context, int index) {
              final Content content = contentList[index];
              return GestureDetector(
                onTap: () => print(content.name),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: content.color, width: 2.0),
                          image: DecorationImage(
                              image: AssetImage(content.imageUrl),
                              fit: BoxFit.cover)),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
