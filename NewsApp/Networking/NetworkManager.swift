//
//  NetworkManager.swift
//  NewsApp
//
//  Created by macbook on 02.01.2023.
//

import Foundation

class NetwrokManager {
    let imageCache = NSCache<NSString, NSData>()
    
    static let shared = NetwrokManager()
    
    private init() {}
    
    private let baseURL = "https://newsapi.org/v2/"
    private let ruTopHeadline = "top-headlines?country=ru&category=sport"
    
    func getNews(completion: @escaping ([News]?) -> ()) {
        let url = URL(string: baseURL + ruTopHeadline + "&apikey=\(APIKey.apiKey)")
        
        guard let url = url else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let envelope = try? JSONDecoder().decode(Envelope.self, from: data)
                completion(envelope?.articles)
            }
        }.resume()
    }
    
    func getImage(urlString: String, completion: @escaping (Data?) -> ()) {
        guard let url = URL(string: urlString) else {return}
        
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            completion(cachedImage as Data)
        } else {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else {return}
                self.imageCache.setObject((data as NSData), forKey: (urlString as NSString))
                completion(data)
            }.resume()
        }
    }
}
