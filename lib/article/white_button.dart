import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/article/ui_helper.dart';

class WhiteButton extends StatelessWidget {
  const WhiteButton({
    Key key,
    this.text,
    this.svg,
  }) : super(key: key);
  final String text;
  final String svg;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding:
          EdgeInsets.only(left: size.width * 0.15, right: size.width * 0.15),
      height: 50,
      // width: 180,
      child: Material(
        // elevation: 18.0,
        shadowColor: Color(0xFF4655AE).withAlpha(60),
        elevation: 7,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(19.0)),
        child: MaterialButton(
          onPressed: () {},
          elevation: 0,
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(19.0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.all(3),
                  height: 23,
                  width: 23,
                  child: SvgPicture.asset("assets/svg/$svg")),
              UIHelper.horizontalSpaceSmall(),
              SizedBox(
                height: 17,
                width: 130,
                child: Text(
                  text,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
