//
//  MainWindow.swift
//  Netflix
//
//  Created by Lode Vanhove on 15/09/2018.
//  Copyright © 2018 Lode Vanhove. All rights reserved.
//

import Cocoa

class MainWindow: NSWindow {
  override func awakeFromNib() {
    super.awakeFromNib()

    setupIdentifiers()
    setupTitlebar()
    setupAppearance()
    setupBehavior()
  }

  func setupTitlebar() {
    titleVisibility = .hidden
    titlebarAppearsTransparent = true
  }

  func setupAppearance() {
    backgroundColor = NSColor(hue: 0.00, saturation: 0.00, brightness: 0.07, alpha: 1.00)
    contentMinSize = NSSize(width: 800, height: 600)
    // styleMask.insert(.)
  }

  func setupIdentifiers() {
    identifier = NSUserInterfaceItemIdentifier(rawValue: "main")
    setFrameAutosaveName("be.bitcrumbs.netflix.main")
  }

  func setupBehavior() {
    isMovableByWindowBackground = true
  }
}
