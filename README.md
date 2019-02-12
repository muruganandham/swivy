# Swivy

Swivy is an opinionated project starter for Flutter applications.
By "opinionated", we mean that the codebase is not highly configurable
for a wide variety of use cases; it will make certain assumptions about
authentication, dependencies, and UX that may or may not work for you.

## Features

Features & benefits of this starter will be listed here as they are developed.

* Example implementation of the [BLoC](https://felangel.github.io/bloc/#/whybloc)
  pattern using [`flutter_bloc`](https://pub.dartlang.org/packages/flutter_bloc).
* Use of [`equatable`](https://pub.dartlang.org/packages/equatable) to reduce
  boilerplate code for equality checking.
* Use of [`meta`](https://pub.dartlang.org/packages/meta) annotations like
  `@immutable` for better static analysis.
* Login with [firebase_auth](https://pub.dartlang.org/packages/firebase_auth)

## Firebase Config Files

There are two files not in source control that you'll need to create for
yourself: `ios/Runner/GoogleService-Info.plist` and
`android/app/google-services.json`. Both are available for download from
[https://console.firebase.google.com](https://console.firebase.google.com) once
you create a Firebase project and add iOS and Android apps. Refer to Google
for detailed instructions on how to do this, but we hope the screenshots below
will get you started:

![Adding a Firebase Project](/screenshots/img1.png?raw=true)
![Add an iOS and Android App to Your Firebase Project](/screenshots/img2.png?raw=true)
![Download Config File for iOS](/screenshots/img3.png?raw=true)
![Download Config File for Android](/screenshots/img4.png?raw=true)

## Certificate for Google Play Services

Additionally, Firebase Auth for Android requires you to provide the SHA-1 of
your signing certificate so Google Play can create an OAuth2 client and API key
for your app, see
[https://developers.google.com/android/guides/client-auth](https://developers.google.com/android/guides/client-auth).

Once you find your SHA-1 with `keytool`, upload it to the Firebase Auth
console (your Android app page). If you do not do this, then a
`com.google.android.gms.common.api.ApiException` will be thrown when trying
to sign-in on Android.
