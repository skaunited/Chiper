//
//  CategoriesIdentifier.swift
//  Chiper
//
//  Created by Skander Bahri on 16/11/2022.
//

import Foundation

public enum CategoriesIdentifier: Int {
    case cars = 1
    case mode = 2
    case tools = 3
    case home = 4
    case activities = 5
    case realEstate = 6
    case books = 7
    case media = 8
    case services = 9
    case animals = 10
    case childrens = 11
    
    public var identifier: String {
        switch self {
        case .cars:
            return "Véhicule"
        case .mode:
            return "Mode"
        case .tools:
            return "Bricolage"
        case .home:
            return "Maison"
        case .activities:
            return "Loisirs"
        case .realEstate:
            return "Immobilier"
        case .books:
            return "Livres/CD/DVD"
        case .media:
            return "Multimédia"
        case .services:
            return "Service"
        case .animals:
            return "Animaux"
        case .childrens:
            return "Enfants"
        }
    }
}
