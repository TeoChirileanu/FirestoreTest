import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class FirestoreTestFirebaseUser {
  FirestoreTestFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

FirestoreTestFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<FirestoreTestFirebaseUser> firestoreTestFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<FirestoreTestFirebaseUser>(
            (user) => currentUser = FirestoreTestFirebaseUser(user));
