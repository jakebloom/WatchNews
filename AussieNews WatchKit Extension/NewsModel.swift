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

let NEWS_URL = "https://s3-us-west-2.amazonaws.com/news.jakebloom.me/news.json"

class NewsModel: ObservableObject {
    
    @Published var headlines: [NewsLine] = []

    func fetch() {
        let task = URLSession.shared.dataTask(with: URL(string: NEWS_URL)!) { data, response, error in
            if error != nil {
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return;
            }
            
            do {
                let decodedHeadlines = try JSONDecoder().decode([NewsLine].self, from: data!)
                DispatchQueue.main.async {
                    self.headlines = decodedHeadlines
                }
            } catch {
                
            }
        }
        task.resume()
    }
}
