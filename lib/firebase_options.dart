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
    apiKey: 'AIzaSyCi3U8673YfIsVXM5XLZTFsFW9bF5eVodw',
    appId: '1:522803119987:web:f98c87ee95dfcb49aba706',
    messagingSenderId: '522803119987',
    projectId: 'blogappbackup',
    authDomain: 'blogappbackup.firebaseapp.com',
    storageBucket: 'blogappbackup.appspot.com',
    measurementId: 'G-PNM5LE2J6P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAsJ_3FrywstKv6cDB8upZwP_Tu_9LyZVs',
    appId: '1:522803119987:android:a07c683db8cca4e2aba706',
    messagingSenderId: '522803119987',
    projectId: 'blogappbackup',
    storageBucket: 'blogappbackup.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAoZtc2qyvc05zwoz4LwGZhthzWLm6TccU',
    appId: '1:522803119987:ios:4d2b9cb92ecc2e2baba706',
    messagingSenderId: '522803119987',
    projectId: 'blogappbackup',
    storageBucket: 'blogappbackup.appspot.com',
    iosClientId: '522803119987-vn4rmqbbb70n32cg4h7kmhqe3t2j5tra.apps.googleusercontent.com',
    iosBundleId: 'com.example.bloggerApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAoZtc2qyvc05zwoz4LwGZhthzWLm6TccU',
    appId: '1:522803119987:ios:4d2b9cb92ecc2e2baba706',
    messagingSenderId: '522803119987',
    projectId: 'blogappbackup',
    storageBucket: 'blogappbackup.appspot.com',
    iosClientId: '522803119987-vn4rmqbbb70n32cg4h7kmhqe3t2j5tra.apps.googleusercontent.com',
    iosBundleId: 'com.example.bloggerApp',
  );
}
