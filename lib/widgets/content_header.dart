import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/widgets/widgets.dart';

import '../models/content_model.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;

  const ContentHeader({Key key, this.featuredContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(featuredContent.imageUrl),
                  fit: BoxFit.cover)),
        ),
        Container(
          height: 500,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
        Positioned(
          bottom: 90.0,
          child: SizedBox(
            width: 300.0,
            child: Image.asset(featuredContent.titleImageUrl),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                icon: Icons.add,
                title: "Add",
                onTap: () => print("Add"),
              ),
              _PlayButton(),
              VerticalIconButton(
                icon: Icons.info_outline,
                title: "Info",
                onTap: () => print("Info"),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      onPressed: () => print("Play"),
      color: Colors.white,
      icon: Icon(Icons.play_arrow),
      label: Text("Play"),
    );
  }
}
