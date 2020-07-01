import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        // 1.获取FlutterViewController(是应用程序的默认Controller)
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        
        // 2.获取MethodChannel(方法通道)
        let batteryChannel = FlutterMethodChannel(name: "coderTao.com/battery", binaryMessenger: controller.binaryMessenger)
        
        // 3.监听方法调用(会调用传入的回调函数)
        batteryChannel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
            // 3.1.判断是否是getBatteryInfo的调用,告知Flutter端没有实现对应的方法
            guard call.method == "getBatteryInfo" else {
                result(FlutterMethodNotImplemented)
                return
            }
            // 3.2.如果调用的是getBatteryInfo的方法, 那么通过封装的另外一个方法实现回调
            self?.receiveBatteryLevel(result: result)
        })
        
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    //私有方法
    private func receiveBatteryLevel(result: FlutterResult) {
        // 1.iOS中获取信息的方式
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        
        // 2.如果没有获取到,那么返回给Flutter端一个异常
        if device.batteryState == UIDevice.BatteryState.unknown {
            result(FlutterError(code: "UNAVAILABLE",
                                message: "Battery info unavailable",
                                details: nil))
        } else {
            // 3.通过result将结果回调给Flutter端
            result(Int(device.batteryLevel * 100))
        }
    }
    
    
}
