import 'package:flutter/material.dart';

class MediumIconButton extends StatelessWidget {
  final IconData btnIcon;
  final String btnText;
  final Function btnCallback;
  const MediumIconButton(this.btnIcon, this.btnText, this.btnCallback);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 70,
      onPressed: () => btnCallback(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      color: Colors.grey[200],
      padding: EdgeInsets.zero,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: 4.0),
            Icon(
              btnIcon,
              size: 28.0,
              color: Color(0xFF32003D),
            ),
            Text(
              btnText.toUpperCase(),
              style: TextStyle(
                fontSize: 11,
                color: Color(0xFF32003D),
              ),
            ),
            SizedBox(height: 4.0),
          ],
        ),
      ),
    );
  }
}
/*Container(
      height: 70,
      width: 74,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(height: 4.0),
          Icon(
            btnIcon,
            size: 28.0,
            color: Color(0xFF32003D),
          ),
          Text(
            btnText.toUpperCase(),
            style: TextStyle(
              fontSize: 11,
              color: Color(0xFF32003D),
            ),
          ),
          SizedBox(height: 4.0),
        ],
      ),
    );*/
