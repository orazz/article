part of 'article_screen.dart';

class ExpandedComments extends StatelessWidget {
  const ExpandedComments({
    Key key,
    this.onTap,
  }) : super(key: key);
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      key: UniqueKey(),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          InkWell(
            onTap: onTap,
            child: new RichText(
              text: new TextSpan(
                style: new TextStyle(
                  fontSize: 13.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  new TextSpan(
                    text: 'Комментарии ',
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  new TextSpan(
                    text: '28',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
          UIHelper.verticalSpaceMedium(),
          Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: CircleAvatar(
                  backgroundImage: NetworkImage('https://i.pravatar.cc/319'),
                ),
              ),
              UIHelper.horizontalSpaceSmall(),
              Expanded(
                // width: MediaQuery.of(context).size.width - 100,
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(splashColor: Colors.transparent),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      autofocus: false,
                      style:
                          TextStyle(fontSize: 16.0, color: Color(0xFF9E9E9E)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF4F7FE),
                        hintText: 'Написать комментарий',
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 10.0, top: 16.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          UIHelper.verticalSpaceSmall(),
          Container(
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("😍", style: TextStyle(fontSize: 25)),
                Text("😫", style: TextStyle(fontSize: 25)),
                Text("😏", style: TextStyle(fontSize: 25)),
                Text("😋", style: TextStyle(fontSize: 25)),
                Text("😊", style: TextStyle(fontSize: 25)),
                Text("😂", style: TextStyle(fontSize: 25)),
              ],
            ),
          ),
          UIHelper.verticalSpaceMedium(),
          _buildUserComment(),
          UIHelper.verticalSpaceMedium(),
          _buildUserComment(),
          UIHelper.verticalSpaceMedium(),
          _buildUserComment(),
          UIHelper.verticalSpaceMedium(),
          _buildUserComment(isSubComment: true),
          UIHelper.verticalSpaceMedium(),
          MaterialButton(
            elevation: 0,
            onPressed: () {},
            color: Color(0xFFEBEFF7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19.0)),
            child: SizedBox(
                height: 55,
                child: Center(child: Text("Показать все комментарии (23)"))),
          )
        ],
      ),
    );
  }

  Widget _buildUserComment({isSubComment = false}) {
    return Padding(
      padding: EdgeInsets.only(left: isSubComment ? 20.0 : 0.0),
      child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: isSubComment ? 30 : 40,
                  height: isSubComment ? 30 : 40,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage('https://i.pravatar.cc/400'),
                  ),
                ),
                UIHelper.horizontalSpace(15),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text("Алёна",
                      style: TextStyle(
                          fontFamily: "SF Pro Text",
                          fontWeight: FontWeight.bold,
                          fontSize: isSubComment ? 14 : 15)),
                ),
                UIHelper.horizontalSpace(15),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    "3 ч",
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "SF Pro Text",
                        fontSize: 13),
                  ),
                )
              ],
            ),
          ),
          UIHelper.verticalSpaceSmall(),
          Text(
            "Если вы видите, что в целом у ребенка все хорошо, он понимает речь, адекватно реагирует на окружающую действительность, то, скорее всего, нет причин для беспокойства.",
            style: TextStyle(
                fontFamily: "SF Pro Text", fontSize: 15, height: 1.28),
          ),
          UIHelper.verticalSpaceSmall(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: isSubComment ? 80 : 100,
                child: Text(
                  "Ответить",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "SF Pro Text",
                      fontSize: 15),
                ),
              ),
              // ignore: deprecated_member_use
              FlatButton.icon(
                onPressed: () {},
                icon:
                    SvgPicture.asset('assets/svg/comments/ic_comment_like.svg'),
                label: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    " 256",
                    style: TextStyle(color: Colors.green[500]),
                  ),
                ),
              ),
              // ignore: deprecated_member_use
              FlatButton.icon(
                onPressed: () {},
                icon: SvgPicture.asset(
                    'assets/svg/comments/ic_comment_dislike.svg'),
                label: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    "  9",
                    style: TextStyle(color: Colors.red[500]),
                  ),
                ),
              ),
              IconButton(
                  icon: SvgPicture.asset('assets/svg/comments/ic_more.svg'),
                  onPressed: () {})
            ],
          ),
        ],
      ),
    );
  }
}
