import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController;
    let channel = FlutterMethodChannel.init(name: "tdc_demo_channel",
                                                   binaryMessenger: controller);
    channel.setMethodCallHandler({
        (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
        if (call.method == "getNativeText") {
            var resultString = "Método iOS, parâmetro:"
            resultString += " \(call.arguments ?? "")"
            
            channel.invokeMethod("getFlutterText", arguments: "iOSParam", result: { result in
                resultString += " \(result ?? "")"
                result(resultString)
            })
            
        } else {
            result(FlutterMethodNotImplemented)
        }
    });
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
