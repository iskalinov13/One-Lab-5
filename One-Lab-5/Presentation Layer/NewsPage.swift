//
//  ViewController.swift
//  One-Lab-5
//
//  Created by Farukh on 23.04.2022.
//

import UIKit

class NewsPage: UIViewController {
    
    private let viewModel: NewsViewModel
    
    init(viewModel: NewsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        view.backgroundColor = .white
        bindViewModel()
        fetchData()
        // Do any additional setup after loading the view.
    }
    
    private func fetchData() {
        viewModel.getTopHeadLines()
    }
    
    private func bindViewModel() {
        viewModel.didLoadNews = { [weak self] news in
            //cellBuilder.buildCells(news
        }
    }
}

