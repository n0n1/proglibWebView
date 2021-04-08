//
//  ViewModel.swift
//  proglibWebView
//
//  Created by Ivan Telenkov on 06.04.2021.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
	var isLoaderVisible = PassthroughSubject<Bool, Never>();
	var webTitle = PassthroughSubject<String, Never>()
	var webViewNavigationPublisher = PassthroughSubject<WebViewNavigationAction, Never>()
}
