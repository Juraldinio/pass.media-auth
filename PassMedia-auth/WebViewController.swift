//
//  WebViewController.swift
//  PassMedia-auth
//
//  Created by Jura on 2/2/19.
//  Copyright © 2019 Juraldinio. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class WebViewController: UIViewController {
	
	var url: URL?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let config = WKWebViewConfiguration()
		config.allowsInlineMediaPlayback = true
		config.mediaTypesRequiringUserActionForPlayback = WKAudiovisualMediaTypes(rawValue: 0)
		
		let webView = WKWebView(frame: .zero, configuration: config)
		webView.navigationDelegate = self
		webView.allowsLinkPreview = false
		webView.translatesAutoresizingMaskIntoConstraints = false
		self.view.addSubview(webView)
		
		NSLayoutConstraint.activate([
			self.view.topAnchor.constraint(equalTo: webView.topAnchor),
			self.view.bottomAnchor.constraint(equalTo: webView.bottomAnchor),
			self.view.leadingAnchor.constraint(equalTo: webView.leadingAnchor),
			self.view.trailingAnchor.constraint(equalTo: webView.trailingAnchor)
			])
		
		if let url = self.url {
			webView.load(URLRequest(url: url))
		}

	}
	
}

extension WebViewController: WKNavigationDelegate {
	
	public func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
		
		webView.configuration.websiteDataStore.httpCookieStore.getAllCookies { cookies in
			print(cookies)
		}
		
		decisionHandler(.allow)
		
	}
	
}
