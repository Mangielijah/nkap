import 'package:flutter/material.dart';

class LargeIconButton extends StatelessWidget {
  final IconData btnIcon;
  final String btnText;
  const LargeIconButton(this.btnIcon, this.btnText);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 70,
      onPressed: () {},
      splashColor: Colors.deepPurple[300],
      padding: EdgeInsets.zero,
      color: Color(0xFF32003D),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: 140,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(width: 4.0),
            Icon(
              btnIcon,
              size: 28.0,
              color: Colors.white,
            ),
            Text(
              btnText.toUpperCase(),
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 4.0),
          ],
        ),
      ),
    );
  }
}

/*
Container(
      height: 70,
      width: 140,
      decoration: BoxDecoration(
        color: Color(0xFF32003D),
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(width: 4.0),
            Icon(
              btnIcon,
              size: 28.0,
              color: Colors.white,
            ),
            Text(
              btnText.toUpperCase(),
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 4.0),
        ],
      ),
    );
*/
