//
//  WebBridge.swift
//  Netflix
//
//  Created by Lode Vanhove on 22/10/2018.
//  Copyright © 2018 Lode Vanhove. All rights reserved.
//

import WebKit

private let webBridgeFileName = "bridge"
private let messageHandlerKey = "WebBridge"

// MARK: - WebBridge

open class WebBridge: NSObject {
  fileprivate weak var webView: WKWebView?

  // MARK: Registration

  open func register(webView: WKWebView) {
    self.webView = webView

    registerScriptMessageHandler()
    addWebBridgeCoreScript()
  }

  open func unregister() {
    webView = nil
    unregisterScriptMessageHandler()
  }

  // MARK: Message handlers

  fileprivate func registerScriptMessageHandler() {
    webView?.configuration.userContentController.add(self, name: messageHandlerKey)
  }

  fileprivate func unregisterScriptMessageHandler() {
    webView?.configuration.userContentController.removeScriptMessageHandler(forName: messageHandlerKey)
  }

  // MARK: User scripts

  fileprivate func addWebBridgeCoreScript() {
    if let nativeURL = scriptFilePath(webBridgeFileName) {
      addUserScript(nativeURL, injectionTime: .atDocumentEnd)
    }
  }

  fileprivate func addUserScript(_ scriptURL: URL, injectionTime: WKUserScriptInjectionTime) {
    if let scriptSource = try? String(contentsOf: scriptURL) {
      let userScript = WKUserScript(source: scriptSource, injectionTime: injectionTime, forMainFrameOnly: true)
      webView?.configuration.userContentController.addUserScript(userScript)
    }
  }

  fileprivate func scriptFilePath(_ fileName: String) -> URL? {
    return Bundle.main.url(forResource: fileName, withExtension: "js")
  }
}

// MARK: - WKScriptMessageHandler

extension WebBridge: WKScriptMessageHandler {
  public func userContentController(_: WKUserContentController, didReceive message: WKScriptMessage) {
    if message.name == messageHandlerKey {}
  }
}
