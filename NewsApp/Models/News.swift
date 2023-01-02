//
//  News.swift
//  NewsApp
//
//  Created by macbook on 02.01.2023.
//

import Foundation

struct Envelope: Decodable {
    let status: String?
    let totalResults: Int?
    let articles: [News]
}

struct News: Decodable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
}
