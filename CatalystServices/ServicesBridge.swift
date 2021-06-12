/*
	2021 Steven Troughton-Smith (@stroughtonsmith)
	Provided as sample code to do with as you wish.
	No license or attribution required.
*/

import Foundation
import SwiftUI

class ServicesBridge: NSObject, ObservableObject {
	
	@Published var serviceString = ""
	
	override init() {
		super.init()
		
		NotificationCenter.default.addObserver(forName: NSNotification.Name("MYServiceCallback"), object: nil, queue: nil) { [unowned self] notification in
			DispatchQueue.main.async {
				if let string = notification.object as? String {
					serviceString = string
				}
			}
		}
	}
	
}
