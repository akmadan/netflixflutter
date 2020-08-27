import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final double screenOffset;

  const CustomAppBar({Key key, this.screenOffset = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      color:
          Colors.black.withOpacity((screenOffset / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
          child: Row(
        children: [
          Image.asset("assets/images/netflix_logo0.png"),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarContent(
                  Title: "TV Shows",
                  OnTap: () => print("TV Shows"),
                ),
                _AppBarContent(
                  Title: "Movies",
                  OnTap: () => print("Movies"),
                ),
                _AppBarContent(
                  Title: "My List",
                  OnTap: () => print("My List"),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

class _AppBarContent extends StatelessWidget {
  final String Title;
  final Function OnTap;

  const _AppBarContent({Key key, this.Title, this.OnTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => OnTap,
      child: Text(
        Title,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16.0),
      ),
    );
  }
}
