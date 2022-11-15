//
//  SharedProtocols.swift
//  Chiper
//
//  Created by Skander Bahri on 15/11/2022.
//
import Foundation

public protocol Presenter: AnyObject {
    func didLoad()
    func willAppear()
    func didAppear()
}

public extension Presenter {
    func didLoad() {}
    func willAppear() {}
    func didAppear() {}
}

public protocol TableViewPresenter: Presenter {
    func cellIdentifier(forIndexPath indexPath: IndexPath) -> String?
    func numberOfSections() -> Int
    func numberOfRows(inSection: Int) -> Int
    func didSelect(at indexPath: IndexPath)
}
