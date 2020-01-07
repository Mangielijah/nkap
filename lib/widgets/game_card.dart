import 'package:flutter/material.dart';
import 'package:nkap_earn/strings.dart';

class GameCard extends StatelessWidget {
  final double leftPadding = 24;
  final Color bkgColor;
  final String title;
  final String imgPath;
  const GameCard({
    this.imgPath,
    this.bkgColor,
    this.title
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 + 10,
      child: Card(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
        color: bkgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.asset(
                imgPath,
                width: 130,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: leftPadding, right: 8),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: EdgeInsets.only(left: leftPadding),
              child: FlatButton(
                onPressed: () {},
                color: Colors.purpleAccent,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(Strings.play_now),
              ),
            ),
            SizedBox(
              height: 18,
            )
          ],
        ),
      ),
    );
  }
}