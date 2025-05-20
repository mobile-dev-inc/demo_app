import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      GeneratedPluginRegistrant.register(with: self)
      // Get root FlutterViewController
      guard let controller = window?.rootViewController as? FlutterViewController else {
          fatalError("rootViewController is not FlutterViewController")
      }
      
      // Create a MethodChannel named "launch_arguments"
      let channel = FlutterMethodChannel(name: "launch_arguments", binaryMessenger: controller.binaryMessenger)
      
      // Get launch arguments from native iOS
      let arguments = ProcessInfo.processInfo.arguments
      
      // Handle method calls from Flutter
      channel.setMethodCallHandler { call, result in
          if call.method == "getLaunchArguments" {
              result(arguments)
          } else {
              result(FlutterMethodNotImplemented)
          }
      }
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
