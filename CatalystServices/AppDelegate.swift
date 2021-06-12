/*
	2021 Steven Troughton-Smith (@stroughtonsmith)
	Provided as sample code to do with as you wish.
	No license or attribution required.
*/

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	#if targetEnvironment(macCatalyst)
	
	static var appKitController:NSObject?
	
	class func loadAppKitIntegrationFramework() {
		
		if let frameworksPath = Bundle.main.privateFrameworksPath {
			let bundlePath = "\(frameworksPath)/AppKitIntegration.framework"
			do {
				try Bundle(path: bundlePath)?.loadAndReturnError()
				
				let bundle = Bundle(path: bundlePath)!
				NSLog("[APPKIT BUNDLE] Loaded Successfully")
				
				if let appKitControllerClass = bundle.classNamed("AppKitIntegration.AppKitController") as? NSObject.Type {
					appKitController = appKitControllerClass.init()
				}
			}
			catch {
				NSLog("[APPKIT BUNDLE] Error loading: \(error)")
			}
		}
	}
	#endif

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		
		#if targetEnvironment(macCatalyst)
		AppDelegate.loadAppKitIntegrationFramework()
		#endif
		
		return true
	}

	// MARK: UISceneSession Lifecycle

	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
	
		if connectingSceneSession.role == .windowApplication {
			return UISceneConfiguration(name: "Main", sessionRole: .windowApplication)
		}
		
		return UISceneConfiguration(name: nil, sessionRole: .windowExternalDisplay)
	}
}

