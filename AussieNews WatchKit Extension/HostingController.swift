//
//  HostingController.swift
//  WatchYaself WatchKit Extension
//
//  Created by Jake Bloom on 26/9/19.
//  Copyright © 2019 Jake Bloom. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController: WKHostingController<ContentView> {
    var model = NewsModel()

    override var body: ContentView {
        return ContentView(model: model)
    }
    
    override func willActivate() {
        super.willActivate()
        model.fetch()
    }
}
