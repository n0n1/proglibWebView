//
//  ContentView.swift
//  proglibWebView
//
//  Created by Ivan Telenkov on 30.03.2021.
//

import SwiftUI

struct ContentView: View {
	@ObservedObject var viewModel = ViewModel()
	@State var isLoaderVisible = true
	@State var webTitle = ""
    var body: some View {
		ZStack {
			VStack(spacing: 0) {
				WebNavigationView()
				WebView(type: .public, url: "https://proglib.io", viewModel: viewModel)
				
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
