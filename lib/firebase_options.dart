// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDLZ0idb8tcodqUx9TKV-mcF0TCPaDN9Fc',
    appId: '1:557585606124:web:8063d78fe2111bdc5f4cc9',
    messagingSenderId: '557585606124',
    projectId: 'naatomeals',
    authDomain: 'naatomeals.firebaseapp.com',
    storageBucket: 'naatomeals.appspot.com',
    measurementId: 'G-ZQ02HW8HEQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA85_THYzI2yYh1O55jDp_twEVUDErA0dI',
    appId: '1:557585606124:android:48fdbfb9e10f0cbd5f4cc9',
    messagingSenderId: '557585606124',
    projectId: 'naatomeals',
    storageBucket: 'naatomeals.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBGsyFd_QO3BTaOhQq9w1sBVaSXV7p9hJI',
    appId: '1:557585606124:ios:5139bb64a7a4175b5f4cc9',
    messagingSenderId: '557585606124',
    projectId: 'naatomeals',
    storageBucket: 'naatomeals.appspot.com',
    androidClientId: '557585606124-98ua81iloabdiup1sqd2v7tdbmdth3d9.apps.googleusercontent.com',
    iosClientId: '557585606124-ehjha983ojvtt00lc3ttipsrc71n2420.apps.googleusercontent.com',
    iosBundleId: 'com.example.naatomeals',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBGsyFd_QO3BTaOhQq9w1sBVaSXV7p9hJI',
    appId: '1:557585606124:ios:024c10df767bf8605f4cc9',
    messagingSenderId: '557585606124',
    projectId: 'naatomeals',
    storageBucket: 'naatomeals.appspot.com',
    androidClientId: '557585606124-98ua81iloabdiup1sqd2v7tdbmdth3d9.apps.googleusercontent.com',
    iosClientId: '557585606124-75k989hvtt32skd5387eu6jnlmaj8cv5.apps.googleusercontent.com',
    iosBundleId: 'com.example.naatomeals.RunnerTests',
  );
}
