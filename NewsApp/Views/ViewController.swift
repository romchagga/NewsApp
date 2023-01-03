//
//  ViewController.swift
//  NewsApp
//
//  Created by macbook on 02.01.2023.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    var viewModel = NewListViewModel()
    
    private lazy var headerView: HeaderView = {
        let headerView = HeaderView(fontSize: 32)
        return headerView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor(red: 31/255, green: 33/255, blue: 37/255, alpha: 1)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: viewModel.reuseID)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupView()
        fetchNews()
        
        }
    
    func setupView() {
        view.backgroundColor = UIColor(red: 31/255, green: 33/255, blue: 37/255, alpha: 1)
        view.addSubview(headerView)
        view.addSubview(tableView)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8)
        ])
    }
    
    func fetchNews() {
        viewModel.getNews { _ in
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.newsVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.reuseID, for: indexPath) as? NewsTableViewCell
        let news = viewModel.newsVM[indexPath.row]
        cell?.newsVM = news
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = viewModel.newsVM[indexPath.row]
        
        guard let url = URL(string: news.url) else {return}
        
        let safariVC = SFSafariViewController(url: url)
        safariVC.modalPresentationStyle = .fullScreen
        present(safariVC, animated: true)
    }
}

