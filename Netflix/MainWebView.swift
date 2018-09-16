//
//  MainWebView.swift
//  Netflix
//
//  Created by Lode Vanhove on 15/09/2018.
//  Copyright © 2018 Lode Vanhove. All rights reserved.
//

import Cocoa
import WebKit

class MainWebView: WKWebView {
  override func awakeFromNib() {
    customUserAgent = Constants.WebView.userAgent
  }
}
