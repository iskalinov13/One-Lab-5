//
//  NewsService.swift
//  One-Lab-5
//
//  Created by Farukh on 23.04.2022.
//

import Foundation
import Alamofire
import AlamofireImage

protocol NewsService {
    func getTopHeadLines(success: @escaping ([New]) -> Void, failure: @escaping (Error) -> Void)

}

class NewsServiceImpl: NewsService {
    func getTopHeadLines(success: @escaping ([New]) -> Void, failure: @escaping (Error) -> Void) {
        let urlString = String(format: "%@top-headlines", EndPoint.baseUrl)
        guard let url = URL(string: urlString) else { return }
        
        let queryParams: Parameters = ["apiKey": EndPoint.apiKey, "country": EndPoint.country]
        
        AF.request(url, method: .get, parameters: queryParams).responseDecodable { (response: DataResponse<NewsWrapper, AFError>) in
            switch response.result {
            case .success(let newsData):
                success(newsData.articles)
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    // service Detail News
    
    // search

}




