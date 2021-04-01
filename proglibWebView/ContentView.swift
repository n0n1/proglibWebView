//
//  ContentView.swift
//  proglibWebView
//
//  Created by Ivan Telenkov on 30.03.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
			WebView(type: .public, url: "https://proglib.io")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
