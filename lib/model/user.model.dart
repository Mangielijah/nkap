import 'package:flutter/foundation.dart';

@immutable
class User {
  final String displayName;
  final String email;
  final String uid;
  final String photoUrl;
  const User(
      {@required this.displayName,
      @required this.email,
      @required this.uid,
      @required this.photoUrl}
    );
}
