part of 'article_screen.dart';

class AppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  AppBar({@required this.expandedHeight, TabBar bottom});

  double blurHeight = 120;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/images/image.png",
          fit: BoxFit.cover,
          height: expandedHeight,
          width: MediaQuery.of(context).size.width,
          colorBlendMode: BlendMode.softLight,
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Text(
              "MySliverAppBar",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: ClipRRect(
            child: Container(
              height: 20.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  // begin: Alignment(-1, 1),
                  // end: Alignment(1, -1),
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Color(0xFFDBE5F2).withOpacity(0.0),
                    Color(0xFFDBE5F2),
                  ],

                  stops: [0.75, 1.0],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: ((expandedHeight - blurHeight) + 0) -
              shrinkOffset, //expandedHeight / 2 - shrinkOffset,
          // left: MediaQuery.of(context).size.width / 4,
          child: Opacity(
            opacity: 1,
            // opacity: (shrinkOffset > 40)
            //     ? (1 - shrinkOffset / (expandedHeight - blurHeight))
            //     : 1,
            child: SizedBox(
              height: blurHeight,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35.0),
                  topRight: Radius.circular(35.0),
                ),
                child: Container(
                  height: blurHeight,
                  // width: MediaQuery.of(context).size.width,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                    child: Container(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      color: Color(0xFFDBE5F2).withOpacity(0.7),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Задержка \nпсихоречевого \nразвития у ребенка",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
