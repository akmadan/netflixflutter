import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/widgets/widgets.dart';

import '../data/data.dart';
import '../data/data.dart';
import '../data/data.dart';
import '../data/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;
  double scrollOffset = 0.0;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          scrollOffset = _scrollController.offset;
        });
      });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("Cast"),
        backgroundColor: Colors.grey[850],
        child: Icon(Icons.cast),
      ),
      appBar: PreferredSize(
        preferredSize: Size(screensize.width, 50.0),
        child: CustomAppBar(
          screenOffset: scrollOffset,
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
              child: ContentHeader(featuredContent: sintelContent)),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
              child: Preview(title: 'Previews', contentList: previews),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(title: "My List", contentList: myList),
          ),
          SliverToBoxAdapter(
            child: ContentList(
                title: "Netflix Originals",
                contentList: originals,
                isOriginals: true),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 20.0),
            sliver: SliverToBoxAdapter(
              child: ContentList(title: "Trending", contentList: trending),
            ),
          ),
        ],
      ),
    );
  }
}
