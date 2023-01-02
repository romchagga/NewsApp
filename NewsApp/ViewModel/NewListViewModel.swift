//
//  NewListViewModel.swift
//  NewsApp
//
//  Created by macbook on 02.01.2023.
//

import Foundation

class NewListViewModel {
    var newsVM = [NewsViewModel]()
    
    let reuseID = "news"
    
    func getNews(completion: @escaping ([NewsViewModel]) -> ()) {
        NetwrokManager.shared.getNews { news in
            guard let news = news else {return}
            let newsVM = news.map(NewsViewModel.init)
            DispatchQueue.main.async {
                self.newsVM = newsVM
                completion(newsVM)
            }
        }
    }
}
