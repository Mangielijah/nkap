import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  final String imgPath;
  final String text;
  const CarouselImage(this.text, this.imgPath,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 4 + 10,
            decoration: BoxDecoration(
              color: Colors.grey[50],
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(imgPath),
              ),
            ),
          )
        ],
      ),
    );
  }
}
