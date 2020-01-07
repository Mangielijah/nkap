import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:nkap_earn/services/firebase_auth.service.dart';
import 'package:nkap_earn/strings.dart';
import 'package:nkap_earn/widgets/login_carousel.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  
  final List<CarouselImage> carouselList = [
    new CarouselImage(Strings.textThree, "images/earn.jpg"),
    new CarouselImage(Strings.textTwo, "images/game.jpg"),
    new CarouselImage(Strings.textOne, "images/invite.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    FirebaseAuthService firebaseAuth = Provider.of<FirebaseAuthService>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            height: (MediaQuery.of(context).size.height / 4) * 3 - 50,
            padding: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(height: 18),
                  Center(
                    child: Text(
                      Strings.welcome,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.1),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: (MediaQuery.of(context).size.height / 4) * 2 - 25,
                    child: Swiper(
                      itemCount: carouselList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return carouselList[index];
                      },
                      index: 0,
                      pagination: SwiperPagination(
                        builder: SwiperPagination.dots,
                        alignment: Alignment.center,
                      ),
                      outer: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            height: (MediaQuery.of(context).size.height * 1) / 4 + 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  Strings.login_reg_text,
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.3),
                ),
                SizedBox(
                  height: 12.0,
                ),
                RawMaterialButton(
                  onPressed: () => firebaseAuth.signInWithGoogle(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          height: 24,
                          image: AssetImage("images/google.png"),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          Strings.googleText,
                          style: TextStyle(fontSize: 17, letterSpacing: 0.25),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  Strings.or,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.75,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                RawMaterialButton(
                  onPressed: () => firebaseAuth.signInWithFacebook(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  splashColor: Colors.blueGrey,
                  fillColor: Color(0xff3b5998),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          height: 24,
                          image: AssetImage("images/fbp.png"),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          Strings.facebookText,
                          style: TextStyle(fontSize: 17, letterSpacing: 0.25, color: Colors.white,),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
