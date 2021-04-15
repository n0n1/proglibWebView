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
	
	@ObservedObject var viewModel: ViewModel
	
	func makeUIView(context: Context) -> WKWebView {
		let preferences = WKPreferences()
		
		let configuration = WKWebViewConfiguration()

		configuration.preferences = preferences
		
		let webView = WKWebView(frame: CGRect.zero, configuration: configuration)
		webView.navigationDelegate = context.coordinator
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
	
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
	
	class Coordinator: NSObject, WKNavigationDelegate {
		var parent: WebView
		var webViewNavigationSubscriber: AnyCancellable? = nil
		
		init(_ webView: WebView) {
			self.parent = webView
			
		}
		
		deinit {
			webViewNavigationSubscriber?.cancel()
		}
		
		func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
			print("didFinish")
			self.parent.viewModel.isLoaderVisible.send(false)
		}
		
		func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
			print("didStartProvisionalNavigation")
			self.parent.viewModel.isLoaderVisible.send(true)
			self.webViewNavigationSubscriber = self.parent.viewModel.webViewNavigationPublisher.receive(on: RunLoop.main).sink(receiveValue: { navigation in
				switch navigation {
					case .backward:
						if webView.canGoBack {
							webView.goBack()
						}
					case .forward:
						if webView.canGoForward {
							webView.goForward()
						}
					case .reload:
						webView.reload()
				}
			})
		}
		
		func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
			print("didFailProvisionalNavigation")
			self.parent.viewModel.isLoaderVisible.send(false)
		}
		
		func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
			print("didCommit")
			self.parent.viewModel.isLoaderVisible.send(true)
		}
		
		func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
			print("didFail")
			self.parent.viewModel.isLoaderVisible.send(false)
		}
		
		func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, preferences: WKWebpagePreferences, decisionHandler: @escaping (WKNavigationActionPolicy, WKWebpagePreferences) -> Void) {
			print("decidePolicyFor")
			decisionHandler(.allow, preferences)
		}
		
		func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
			print("didReceiveServerRedirectForProvisionalNavigation")
		}
		
		func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
			print("webViewWebContentProcessDidTerminate")
			self.parent.viewModel.isLoaderVisible.send(false)
		}
		
	}
	
}
