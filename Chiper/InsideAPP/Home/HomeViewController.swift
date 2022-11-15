//
//  HomeViewController.swift
//  Chiper
//
//  Created by Skander Bahri on 13/11/2022.
//

import UIKit

class HomeViewController: UIViewController {
    var presenter: HomePresenterProtocol?
    var tableView: UITableView?
    
    lazy var drawer: DrawingProtocol = Drawing.shared
    lazy var themedNavigationBar: ThemedNavigationBarProtocol = ThemedNavigationBar.shared
    lazy var themedTableView: ThemedTableViewProtocol = ThemedTableView.shared
    
    private var navigationBar: UINavigationBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.didLoad()
        setupView()
    }
}

private extension HomeViewController {
    func setupView() {
        setupStyle()
        setupNavigationBar()
        setupTableView()
    }
    
    func setupNavigationBar() {
        navigationBar = themedNavigationBar.renderNavigationBar(backgroundColor: .BC1,
                                                                barTintColor: .BC1,
                                                                title: Constants.homeViewControllerTitle,
                                                                navigationItemBackgroundColor: .BC1,
                                                                tintColor: .BC4,
                                                                barButtonAction: filterAction())
        navigationBar.orDefault.delegate = self
        view.addSubview(navigationBar.orDefault)
        navigationBar.orDefault.anchor(top: view.topAnchor,
                                       left:  view.leftAnchor,
                                       right:  view.rightAnchor,
                                       paddingTop: UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0,
                                       height: 44)
    }
    
    func setupTableView() {
        tableView = themedTableView.renderTableView(translatesAutoresizingMaskIntoConstraints: false)
        view.addSubview(tableView.orDefault)
        
        tableView.orDefault.anchor(top: navigationBar.orDefault.bottomAnchor,
                                   left: view.leftAnchor,
                                   bottom: view.bottomAnchor,
                                   right: view.rightAnchor)
        
        tableView.orDefault.register(ItemTableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier )
        tableView.orDefault.estimatedRowHeight = UITableView.automaticDimension
        tableView.orDefault.delegate = self
        tableView.orDefault.dataSource = self
    }
    
    func setupStyle() {
        view.backgroundColor = .BC1
    }
    
    func filterAction() -> UIAction {
        let filterAction = UIAction() { [weak self] action in
            print("hello skander")
        }
        
        return filterAction
    }
}

