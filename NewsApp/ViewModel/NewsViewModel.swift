//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by macbook on 02.01.2023.
//

import Foundation

struct NewsViewModel {
    let news: News
    
    var author: String {
        return news.author ?? "Unknown"
    }
    
    var title: String {
        return news.title ?? ""
    }
    
    var description: String {
        return news.description ?? ""
    }
    
    var url: String {
        return news.url ?? ""
    }
    
    var urlToImage: String {
        return news.urlToImage ?? "https://i.pinimg.com/736x/2f/e0/f7/2fe0f7fa2237d401d20a6b0f121dd41f--newspaper-front-pages-news-bulletin.jpg"
    }
}
