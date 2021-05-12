import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/article/ui_helper.dart';
import 'package:task/article/white_button.dart';

part 'appbar.dart';
part 'html_text_sample.dart';
part 'expanded_comments.dart';

class ArticleScreen extends StatefulWidget {
  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen>
    with SingleTickerProviderStateMixin {
  var top = 0.0;
  double topImageHeight = 400;
  bool commentsCollapsed = false;

  Size size;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    size = MediaQuery.of(context).size;
    return new Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [
            Color(0xFFEDE4EB),
            Color(0xFFDFE7F0),
            Color(0xFFEDE4EB),
          ],
          begin: Alignment(-1, 1),
          end: Alignment(1, -1),
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          color: Color(0xFFDBE5F2).withOpacity(0.3),
          alignment: Alignment.center,
          child: _buildScrollView(),
        ),
      ),
    );
  }

  CustomScrollView _buildScrollView() {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: AppBar(expandedHeight: topImageHeight),
          // pinned: true,
          // floating: true,
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: SvgPicture.asset('assets/svg/ic_eye.svg'),
                    ),
                    UIHelper.horizontalSpaceSmall(),
                    Text("54615", style: TextStyle(fontSize: 17)),
                    UIHelper.horizontalSpaceMedium(),
                    Container(
                      child: SvgPicture.asset('assets/svg/ic_comment.svg'),
                    ),
                    UIHelper.horizontalSpaceSmall(),
                    Text("123", style: TextStyle(fontSize: 17)),
                    UIHelper.horizontalSpaceMedium(),
                    Container(
                      child: SvgPicture.asset('assets/svg/ic_clock.svg'),
                    ),
                    UIHelper.horizontalSpaceSmall(),
                    Text("9 мин", style: TextStyle(fontSize: 17)),
                  ],
                ),
                UIHelper.verticalSpaceSmall(),
                _buildLikesOverlappedAvatars(),
              ],
            ),
          ),
        ),
        UIHelper.verticalSliverSpaceLarge(),
        _buildAuthor(),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Html(data: HTML_STRING, customRender: {
              'iframe': (context, _) {
                // print('attributes from iFrame: $attributes');
                Widget _widget = Text('iFrame Render Custom Widget');

                return _widget;
              },
            }, style: {
              "body": Style(
                  fontFamily: "SF Pro Text",
                  fontSize: FontSize(17),
                  lineHeight: LineHeight.em(1.26)),
            }),
          ),
        ),
        _buildAuthor(),
        _buildGradientText(),
        UIHelper.verticalSliverSpaceMedium(),
        _buildDidLike(),
        SliverToBoxAdapter(
          child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              // transitionBuilder: (Widget child, Animation<double> animation) {
              //   return ScaleTransition(child: child, scale: animation);
              // },
              child: commentsCollapsed
                  ? _buildCollapsedComments()
                  : ExpandedComments(
                      onTap: () {
                        setState(() {
                          commentsCollapsed = !commentsCollapsed;
                        });
                      },
                    )),
        ),
        UIHelper.verticalSliverSpaceLarge(),
      ],
    );
  }

  Widget _buildCollapsedComments() {
    return Card(
      key: UniqueKey(),
      color: Color(0xFFF1F4FB),
      shadowColor: Color(0xFF4655AE).withAlpha(30),
      elevation: 7,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19.0)),
      margin: EdgeInsets.all(20.0),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 30.0, bottom: 30.0, left: 30.0, right: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "28 Комментариев",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            UIHelper.verticalSpaceMedium(),
            InkWell(
              onTap: () {
                setState(() {
                  commentsCollapsed = !commentsCollapsed;
                });
              },
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFB68FFF).withOpacity(0.5),
                      Color(0xFF6399F8).withOpacity(0.7),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Center(child: Text("Показать комментарии")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildDidLike() {
    return SliverToBoxAdapter(
      child: Card(
        color: Color(0xFFF1F4FB),
        shadowColor: Color(0xFF4655AE).withAlpha(30),
        elevation: 7,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(19.0)),
        margin: EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Понравилась статья? \nСохраните, и оцените",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              UIHelper.verticalSpaceMedium(),
              WhiteButton(
                text: "Мне нравится",
                svg: "ic_like.svg",
              ),
              UIHelper.verticalSpaceSmall(),
              WhiteButton(
                text: "В закладки",
                svg: "ic_save.svg",
              ),
              UIHelper.verticalSpace(25),
              SizedBox(
                  width: 210,
                  child: Center(child: _buildLikesOverlappedAvatars())),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildLikesOverlappedAvatars() {
    return SizedBox(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 75,
            height: 40,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Color(0xFFE5E6EE), width: 2),
                    ),
                    child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://i.pravatar.cc/300') // Provide your custom image
                        ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Color(0xFFE5E6EE), width: 2),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://i.pravatar.cc/302') // Provide your custom image
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ClipRRect(
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: Color(0xFFE5E6EE), width: 2),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                            radius: 18,
                            backgroundImage: NetworkImage(
                                'https://i.pravatar.cc/301') // Provide your custom image
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          UIHelper.horizontalSpaceSmall(),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "826 нравится",
              style: TextStyle(fontSize: 15, fontFamily: 'SF Pro Text'),
            ),
          )
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildGradientText() {
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Color(0xff6395F8), Color(0xffB68FFF)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(top: 15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Депрессия',
                style: new TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = linearGradient),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Депрессия',
                style: new TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = linearGradient),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Депрессия',
                style: new TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = linearGradient),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildAuthor() {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.only(top: 0, left: 20.0, right: 20.0),
        child: new RichText(
          text: new TextSpan(
            style: new TextStyle(
              fontSize: 13.0,
              color: Colors.black,
            ),
            children: <TextSpan>[
              new TextSpan(
                  text: 'Автор публикации: ',
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 13,
                  )),
              new TextSpan(
                text: 'Татьяна Андреева, педагог-психолог',
                style: new TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'SF Pro Text',
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
