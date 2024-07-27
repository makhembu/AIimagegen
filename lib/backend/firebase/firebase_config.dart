import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCfNBVfFFL92RsKqFv7-CuBtoMGOdKD5OQ",
            authDomain: "image-gerator-ykf71m.firebaseapp.com",
            projectId: "image-gerator-ykf71m",
            storageBucket: "image-gerator-ykf71m.appspot.com",
            messagingSenderId: "360283459994",
            appId: "1:360283459994:web:226b5a81f79cb70b0a6a23"));
  } else {
    await Firebase.initializeApp();
  }
}
