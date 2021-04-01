//
//  WebView.swift
//  proglibWebView
//
//  Created by Ivan Telenkov on 30.03.2021.
//

import Foundation
import SwiftUI
import Combine
import WebKit
import UIKit

struct WebView: UIViewRepresentable {
	
	var type: URLType
	var url: String?
	
	func makeUIView(context: Context) -> WKWebView {
		let preferences = WKPreferences()
		
		let configuration = WKWebViewConfiguration()
		configuration.preferences = preferences
		
		let webView = WKWebView(frame: CGRect.zero, configuration: configuration)
		
		webView.allowsBackForwardNavigationGestures = true
		webView.scrollView.isScrollEnabled = true
		return webView
	
	}
	
	func updateUIView(_ webView: WKWebView, context: Context) {
		if let urlValue = url  {
			if let requestUrl = URL(string: urlValue) {
				webView.load(URLRequest(url: requestUrl))
			}
		}
	}
}
