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
    var activityIndicator: UIActivityIndicatorView?
    
    lazy var drawer: DrawingProtocol = Drawing.shared
    lazy var themedNavigationBar: ThemedNavigationBarProtocol = ThemedNavigationBar.shared
    lazy var themedTableView: ThemedTableViewProtocol = ThemedTableView.shared
    lazy var themedIndicatorView: ThemedActivityIndicatorViewProtocol = ThemedActivityIndicatorView.shared
    
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
        setupIndicatorView()
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
        let filterAction = UIAction() { [weak self] _ in
            guard let self = self else { return }
            self.showFilterOptions()
        }
        
        return filterAction
    }
    
    func setupIndicatorView() {
        let activityIndicatorView = themedIndicatorView.renderIndicatorView()
        self.activityIndicator = activityIndicatorView
        tableView?.backgroundView = activityIndicatorView
        tableView?.separatorStyle = .none
        self.activityIndicator?.startAnimating()
    }
    
    private func showFilterOptions() {
        let alert = UIAlertController(title: Constants.filterTitle,
                                      message: nil,
                                      preferredStyle: .actionSheet)
        let currentAction = UIAlertAction(title: Constants.cancelButton,
                                          style: .cancel,
                                          handler: nil)
        currentAction.titleTextColor = .BC4
        alert.addAction(currentAction)
        
        let resetFilterAction = UIAlertAction(title: Constants.allCategories,
                                              style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.presenter?.setFilter(by: nil)
        }
        alert.addAction(resetFilterAction)
        presenter?.getCategories().forEach{ category in
            let action = UIAlertAction(title: "\(category.name)",
                                       style: .default) { [weak self] _ in
                guard let self = self else { return }
                self.presenter?.setFilter(by: category)
            }
            action.titleTextColor = .BC3
            alert.addAction(action)
        }
        
        alert.popoverPresentationController?.sourceView = navigationBar
        alert.popoverPresentationController?.sourceRect = navigationBar.orDefault.bounds
        
        present(alert, animated: true, completion: nil)
    }
}

