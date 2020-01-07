import 'package:flutter/material.dart';
import 'package:nkap_earn/services/firebase_auth.service.dart';
import 'package:nkap_earn/strings.dart';
import 'package:nkap_earn/widgets/circular_image.dart';
import 'package:nkap_earn/widgets/game_card.dart';
import 'package:nkap_earn/widgets/large_icon_button.dart';
import 'package:nkap_earn/widgets/medium_icon_button.dart';
import 'package:nkap_earn/widgets/single_profile_stats_icon.dart';
import 'package:nkap_earn/widgets/single_profile_stats_widget.dart';
import 'package:provider/provider.dart';
import 'package:nkap_earn/model/user.model.dart';

class Profile extends StatelessWidget {
  final double leftPadding = 24.0;

  @override
  Widget build(BuildContext context) {
    final FirebaseAuthService firebaseAuth = Provider.of<FirebaseAuthService>(context);
    final user = Provider.of<User>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 80,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                _buildProfileNameRow(
                  user.photoUrl,
                  //"https://www.picmonkey.com/blog/wp-content/uploads/2016/11/1-intro-photo-final.jpg",
                  user.displayName,
                  user.email.split("@")[0],
                ),
                SizedBox(
                  height: 20.0,
                ),
                _profileStatsRow(),
                SizedBox(
                  height: 18.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: leftPadding + 8),
                  child: Text(
                    Strings.games,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0
                    ),
                  ),
                ),
                SizedBox(height: 6.0,),
                Padding(
                  padding: EdgeInsets.only(left: leftPadding + 9, right: 8),
                  child: Text(
                    "\""+Strings.howToEarnText+"\"",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 0.9,
                      fontStyle: FontStyle.italic
                    ),
                  ),
                ),
                SizedBox(height: 18,),
                Container(
                  height: 280,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    primary: false,
                    padding: EdgeInsets.only(left: leftPadding, right: 8.0),
                    children: <Widget>[
                      new GameCard(
                        bkgColor: Colors.deepPurple[100],
                        imgPath: "images/tictactoe.png",
                        title: "Tic Tac Toe Game",
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      new GameCard(
                        bkgColor: Colors.yellow[200],
                        imgPath: "images/tictactoe.png",
                        title: "Word Puzzle Game",
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      new GameCard(
                        bkgColor: Colors.blue[100],
                        imgPath: "images/tictactoe.png",
                        title: "2048 Puzzle Game",
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      new GameCard(
                        bkgColor: Colors.orange[100],
                        imgPath: "images/tictactoe.png",
                        title: "Rock Paper Scissors",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24 ,)
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 75,
        child: Padding(
          padding: EdgeInsets.only(left: leftPadding, bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(child: MediumIconButton(Icons.power_settings_new, "Log out", firebaseAuth.signOut)),
              Flexible(child: MediumIconButton(Icons.card_giftcard, "Invite", (){})),
              Flexible(child: LargeIconButton(Icons.account_balance_wallet, "WITHDRAW")),
            ],
          ),
        ),
      ),
    );
  }

  Container _profileStatsRow() {
    return Container(
      padding: EdgeInsets.only(left: leftPadding + 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ProfileStat("100", "EARNINGS", "usd"),
          ProfileStatIcon("3", "COINS LEFT", Icons.casino),
          ProfileStatIcon("3", "FRIENDS", Icons.tag_faces),
          SizedBox(
            width: 10.0,
          )
        ],
      ),
    );
  }

  _buildProfileNameRow(String imgPath, String name, String username) {
    return Container(
      height: 76,
      padding: EdgeInsets.symmetric(horizontal: leftPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CircleImage(imgPath, 70),
              SizedBox(
                width: 22,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    "@" + username,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            ],
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}
