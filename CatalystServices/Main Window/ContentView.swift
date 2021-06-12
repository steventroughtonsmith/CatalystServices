/*
	2021 Steven Troughton-Smith (@stroughtonsmith)
	Provided as sample code to do with as you wish.
	No license or attribution required.
*/

import SwiftUI

struct ContentView: View {
	@ObservedObject var bridge = ServicesBridge()
	
	var body: some View {
		ScrollView() {
			VStack(spacing:UIFloat(40)) {
				
				
				Group {
					Text("Step 1: Enable your new service")
					
					VStack {
						
						
						Image("guide1")
							.resizable()
							.aspectRatio(contentMode: .fit)
						Image("guide2")
							.resizable()
							.aspectRatio(contentMode: .fit)
					}
				}
				
				
				Divider()
				
				
				Text("Step 2: Right click some text in another app, choose 'Services', and pick your new \(Text("Send text to CatalystServices").bold()) service.")
				
				
				Divider()
				
				
				Text("Output:")
					.bold()
				
				Text(bridge.serviceString == "" ? "None" : bridge.serviceString)
			}
			.padding(UIFloat(40))
			
		}
		.frame(width:UIFloat(500))
		
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
