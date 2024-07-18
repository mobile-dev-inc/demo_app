<div align="center">

![App logo][app-logo]

[![Get it on Google Play][google-play-badge]][google-play-link]
[![Download on the App Store][app-store-badge]][app-store-link]

# Discover Rudy

> Cross-platform version of the Discover Rudy app.

[Project landing page](https://otwartaturystyka.pl)

</div>

_Started on Friday, 21th October 2016 (Android version)_

_Started on Monday, 12th August 2019 (Flutter version)_

# Overview

Discover Rudy is an easy-to-use yet powerful tourist application designed for
people who visit [the town of
Rudy](https://en.wikipedia.org/wiki/Rudy,_Silesian_Voivodeship) and its
surroundings\*.

- The app has support for many regions, but currently the only one is Rudy.
  Also, the name of the app will have to be changed when more regions are added
  in the future.

Main features:

- map of 70+ places with possibility to quickly start navigation with Google
  Maps
- monuments and interesting places
- bike trails and attractions
- legends and history
- tourist information, notifications about events in the area
- easy check of air quality
- likes and comments on places
- marking places as "discovered" if you are nearby (<100m)

Planned features:

- receiving rewards for visited places

# Release process

`master` is the main branch.

Newest version tag (e.g `v4.2.0`) always represents the code that's been built
and deployed to app stores.

Feature and bugfix branches must be named accordingly (e.g `feature/<name>` or
`fix/<name>`).

# Building

The app uses [Firebase](https://firebase.google.com) as a backend.

To generate freezed models etc.: `$ flutter pub run build_runner build`

To generate localization files: `$ flutter gen-l10n`

To format all code: `$ dart format .`

### Android

1. Get `google-services.json` from Firebase and place it in `android/app`.
2. Extract `api_key.current_key` from `google-services.json` and place it under
   `android/app/src/main/res/values/google_maps_key.xml`, like this:

```
<?xml version="1.0" encoding="utf-8"?>
<resources>
  <string name="google_maps_key" templateMergeStrategy="preserve" translatable="false">KEY_GOES_HERE</string>
</resources>
```

### iOS

1. Get `GoogleService-Info.plist` from Firebase and place it in `ios/Runner`.

# Releasing

The app uses [fastlane](https://fastlane.tools) to manage the release process.

[app-logo]: android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png
[google-play-badge]: art/google-play-badge.png
[google-play-link]: https://play.google.com/store/apps/details?id=pl.baftek.discoverrudy
[app-store-badge]: art/app-store-badge.png
[app-store-link]: https://apps.apple.com/app/id1528404703
