//
//  StoryView.swift
//  WatchYaself WatchKit Extension
//
//  Created by Jake Bloom on 26/9/19.
//  Copyright © 2019 Jake Bloom. All rights reserved.
//

import SwiftUI

struct StoryView: View {
    var story: String

    var body: some View {
        List {
            Text(story)
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(story: "gfhjkhjhkdghkgjklg")
    }
}
