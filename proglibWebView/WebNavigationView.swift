//
//  WebNavigationView.swift
//  proglibWebView
//
//  Created by Ivan Telenkov on 04.04.2021.
//

import SwiftUI

struct WebNavigationView: View {
	@ObservedObject var viewModel: ViewModel
    var body: some View {
		VStack {
			Divider()
			HStack(spacing: 10) {
				Divider()
				Button(action: {
					viewModel.webViewNavigationPublisher.send(.backward)
				}, label: {
					Image(systemName: "chevron.left")
						.font(.system(size: 30, weight: .regular))
						.imageScale(.medium)
				})
				Divider()
				Button(action: {
					viewModel.webViewNavigationPublisher.send(.forward)
				}, label: {
					Image(systemName: "chevron.right")
						.font(.system(size: 30, weight: .regular))
						.imageScale(.medium)
				})
				Divider()
				Spacer()
				Divider()
				Button(action: {
					viewModel.webViewNavigationPublisher.send(.reload)
				}, label: {
					Image(systemName: "arrow.clockwise")
						.font(.system(size: 30, weight: .regular))
						.imageScale(.medium)
				})
				Divider()
			}
			.frame(height: 50)
			Divider()
		}
    }
}

struct WebNavigationView_Previews: PreviewProvider {
    static var previews: some View {
		WebNavigationView(viewModel: ViewModel())
    }
}
