//
//  BaseWebViewVM.swift
//  SkyVision
//
//  Created by Justin Edmund on 2/19/24.
//

import Foundation
import SwiftUI
import WebKit

class WebViewModel: ObservableObject {
    @Published var webResource: String?
    var webView: WKWebView
    
    init(webResource: String? = nil) {
        self.webResource = webResource
        
        self.webView = WKWebView(frame: .zero,
                                 configuration: WKWebViewConfiguration())
    }
    
    func loadWebPage() {
        if let webResource = webResource {
            guard let url = URL(string: webResource) else {
                print("Bad URL")
                return
            }
            
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
