//
//  NewsModel.swift
//  WatchYaself WatchKit Extension
//
//  Created by Jake Bloom on 26/9/19.
//  Copyright © 2019 Jake Bloom. All rights reserved.
//

import Foundation

struct NewsLine: Identifiable, Codable {
    let titleText: String
    let mainText: String
    let uid: String
    let updateDate: String
    let redirectionUrl: String

    var id: String {
        titleText
    }
}

enum NewsModelState {
    case LOADING
    case SUCCESS
    case FAILURE
}

let NEWS_URL = "https://s3-us-west-2.amazonaws.com/news.jakebloom.me/news.json"

class NewsModel: ObservableObject {
    
    @Published var headlines: [NewsLine] = []
    @Published var state: NewsModelState = .LOADING

    func fetch() {
        let task = URLSession.shared.dataTask(with: URL(string: NEWS_URL)!) { data, response, error in
            if error != nil {
                self.onFail()
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                self.onFail()
                return;
            }
            
            do {
                let decodedHeadlines = try JSONDecoder().decode([NewsLine].self, from: data!)
                DispatchQueue.main.async {
                    self.headlines = decodedHeadlines
                    self.state = .SUCCESS
                }
            } catch {
                
            }
        }
        task.resume()
    }
    
    func onFail() {
        DispatchQueue.main.async {
            self.state = .FAILURE
        }
    }
}
