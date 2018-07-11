import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    guard let controller = window?.rootViewController as? FlutterViewController else {
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    let channel = FlutterMethodChannel(name: "tdc_demo_channel", binaryMessenger: controller)
    channel.setMethodCallHandler { (call, result) in
        if call.method == "getNativeText" {
            channel.invokeMethod("getFlutterText", arguments: "iOSParam", result: {
                result("Método iOS, parâmetro: \(call.arguments ?? "")" + "\($0 ?? "")")
            })
        } else {
            result(FlutterMethodNotImplemented)
        }
    }
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
