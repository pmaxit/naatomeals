import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // listen to auth state changes

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  Future<void> handleUser(value, data) {
    value.user!.updateDisplayName(data['name']);
    return _firestore.collection('users').doc(value.user.uid).set(data);
  }

  Future<void> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => handleUser(value, {
                'name': name,
                'email': email,
                'phone': phone,
                'uid': value.user!.uid,
              }));
    } on FirebaseAuthException catch (e) {
      print(e);
      // try to signin with the email
      if (e.code == 'email-already-in-use') {
        signInWithEmailAndPassword(email, password);
      }
      //throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  // anonoumos sign in
  Future<void> signInAnonymously() async {
    try {
      await _firebaseAuth
          .signInAnonymously()
          .then((value) => handleUser(value, {
                'name': 'Guest',
                'email': 'guest@email.com',
                'phone': '111-111-1111',
                'uid': value.user!.uid,
              }));
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }
}

// create provider
final authProvider = Provider<Auth>((ref) => Auth());

// create provider for auth state changes
final authStateChangesProvider =
    StreamProvider<User?>((ref) => ref.watch(authProvider).authStateChanges);
