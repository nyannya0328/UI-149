//
//  UrlViewModel.swift
//  UI-150
//
//  Created by にゃんにゃん丸 on 2021/03/27.
//

import SwiftUI

class UrlViewModel: ObservableObject {
    @Published var urls = [
        page(url: URL(string: "https://www.amazon.com/")!),
        page(url: URL(string: "https://www.amazon.com/")!),
        page(url: URL(string: "https://www.amazon.com/")!),
        page(url: URL(string: "https://www.amazon.com/")!),
        page(url: URL(string: "https://www.amazon.com/")!),
        page(url: URL(string: "https://www.amazon.com/")!),
        page(url: URL(string: "https://www.amazon.com/")!)
    ]
    
    @Published var selectedTab = "pen"
    
    @Published var currentpage : page?
}

