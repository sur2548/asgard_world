# asgard_world

A new Flutter project.

## Getting Started

* Get an API key at <https://cloud.google.com/maps-platform/>.

* Enable Google Map SDK for each platform.
    * Go to [Google Developers Console](https://console.cloud.google.com/).
    * Choose the project that you want to enable Google Maps on.
    * Select the navigation menu and then select "Google Maps".
    * Select "APIs" under the Google Maps menu.
    * To enable Google Maps for Android, select "Maps SDK for Android" in the "Additional APIs" section, then select "ENABLE".
    * To enable Google Maps for iOS, select "Maps SDK for iOS" in the "Additional APIs" section, then select "ENABLE".
    * To enable Google Maps for Web, enable the "Maps JavaScript API".
    * Make sure the APIs you enabled are under the "Enabled APIs" section.

For more details, see [Getting started with Google Maps Platform](https://developers.google.com/maps/gmp-get-started).

### Android

1Specify your API key in the application manifest `android/app/src/main/AndroidManifest.xml`:

```xml
<manifest ...
  <application ...
    <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="YOUR KEY HERE"/>
```

### iOS

To set up, specify your API key in the application delegate `ios/Runner/AppDelegate.swift`:

```swift
import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("YOUR KEY HERE")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
```

