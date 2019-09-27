//
//  ContentView.swift
//  WatchYaself WatchKit Extension
//
//  Created by Jake Bloom on 26/9/19.
//  Copyright © 2019 Jake Bloom. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model: NewsModel
    
    var body: some View {
        List {
            ForEach(model.headlines) { headline in
                NavigationLink(destination: StoryView(story: headline.mainText)) {
                    Text(headline.titleText).font(.footnote).padding()
                }
            }
        }
        .navigationBarTitle(Text("Headlines"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: NewsModel())
    }
}
