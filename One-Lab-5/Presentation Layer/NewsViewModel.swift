//
//  NewsViewModel.swift
//  One-Lab-5
//
//  Created by Farukh on 23.04.2022.
//

import Foundation

class NewsViewModel {
    private let newsService: NewsService
    
    var didLoadNews: (([New]) -> Void)?
    init(newsService: NewsService) {
        self.newsService = newsService
    }
    
    func getTopHeadLines() {
        newsService.getTopHeadLines(
            success: { [weak self] news in
                print(news)
                self?.didLoadNews?(news)
            },
            failure: { error in
                print(error.localizedDescription.description)
            }
        )
    }
}
