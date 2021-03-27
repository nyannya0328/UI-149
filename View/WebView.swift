//
//  WebView.swift
//  UI-150
//
//  Created by にゃんにゃん丸 on 2021/03/27.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var url : URL
    func makeUIView(context: Context) -> WKWebView {
        
        let view = WKWebView()
        view.load(URLRequest(url: url))
        view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        view.isUserInteractionEnabled = false
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}

