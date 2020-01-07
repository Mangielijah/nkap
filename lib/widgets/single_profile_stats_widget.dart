import 'package:flutter/material.dart';

class ProfileStat extends StatelessWidget {
  final String value;
  final String desc;
  final String currency;
  const ProfileStat(this.value, this.desc, this.currency);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            (currency == "usd") ? "\$ " + value : value + " Frs",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF32003D),
            ),
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            desc,
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey),
          )
        ],
      ),
    );
  }
}
