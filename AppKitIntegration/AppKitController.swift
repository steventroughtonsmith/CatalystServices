/*
	2021 Steven Troughton-Smith (@stroughtonsmith)
	Provided as sample code to do with as you wish.
	No license or attribution required.
*/
import AppKit
import CoreServices

class ServiceProvider: NSObject {

	@objc func myService(_ pasteboard: NSPasteboard, userData: String?, error: AutoreleasingUnsafeMutablePointer<NSString>) {
		guard let obj = pasteboard.string(forType: NSPasteboard.PasteboardType.string) else {
			NSLog("[SERVICES] Error: decoding type")
			return
		}
		
		NotificationCenter.default.post(name: NSNotification.Name("MYServiceCallback"), object: obj, userInfo: nil)
	}
}

class AppKitController : NSObject {
	
	override init() {
		super.init()
		NSApplication.shared.servicesProvider = ServiceProvider()
		NSUpdateDynamicServices()
	}
	
}
