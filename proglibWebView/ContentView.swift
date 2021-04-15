//
//  ContentView.swift
//  proglibWebView
//
//  Created by Ivan Telenkov on 30.03.2021.
//

import SwiftUI

struct ContentView: View {
	@ObservedObject var viewModel = ViewModel()
	@State var isLoaderVisible = false
    var body: some View {
		ZStack {
			VStack(spacing: 0) {
				WebNavigationView(viewModel: viewModel)
				WebView(type: .public, url: "https://proglib.io", viewModel: viewModel)
				
			}.onReceive(self.viewModel.isLoaderVisible.receive(on: RunLoop.main)) { value in
				self.isLoaderVisible = value
			}
			if isLoaderVisible {
				LoaderView()
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView()
    }
}
