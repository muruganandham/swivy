import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
        ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        
        let fview = FViewFactory()
        registrar(forPlugin: "FView1").register(fview, withId: "iOSView")
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
