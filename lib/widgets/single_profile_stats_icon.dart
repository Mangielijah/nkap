import 'package:flutter/material.dart';

class ProfileStatIcon extends StatelessWidget {
  final String value;
  final String desc;
  final IconData icon;
  const ProfileStatIcon(this.value, this.desc, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                value,
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF32003D)
                ),
              ),
              SizedBox(width: 2.0,),
              Icon(
                icon,
                size: 20,
                color: Color(0xFF32003D),
              )
            ],
          ),
          SizedBox(height: 4.0,),
          Text(
            desc,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey
            ),
          )
        ],
      ),
    );
  }
}
