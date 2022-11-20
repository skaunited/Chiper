//
//  StaticMocks.swift
//  ChiperTests
//
//  Created by Skander Bahri on 20/11/2022.
//

import Foundation
@testable import Chiper

struct StaticMocks {
    static let categoryArray: [Chiper.Category] = [Category(id: 1, name: "Véhicule"),
                                             Category(id: 2, name: "Mode"),
                                             Category(id: 3, name: "Bricolage"),
                                             Category(id: 4, name: "Maison"),
                                             Category(id: 5, name: "Loisirs"),
                                             Category(id: 6, name: "Immobilier"),
                                             Category(id: 7, name: "Livres/CD/DVD"),
                                             Category(id: 8, name: "Multimédia"),
                                             Category(id: 9, name: "Service"),
                                             Category(id: 10, name: "Animaux"),
                                             Category(id: 11, name: "Enfants")]

    static let listingEntity = [ListingEntity(image: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/2c9563bbe85f12a5dcaeb2c40989182463270404.jpg",
                                       title: "Statue homme noir assis en plâtre polychrome",
                                       date: "2019-11-05T15:56:59+0000",
                                       description: "Magnifique Statuette homme noir assis fumant le cigare en terre cuite et plâtre polychrome réalisée à la main.  Poids  1,900 kg en très bon état, aucun éclat  !  Hauteur 18 cm  Largeur : 16 cm Profondeur : 18cm  Création Jacky SAMSON  OPTIMUM  PARIS  Possibilité de remise sur place en gare de Fontainebleau ou Paris gare de Lyon, en espèces (heure et jour du rendez-vous au choix). Envoi possible ! Si cet article est toujours visible sur le site c'est qu'il est encore disponible",
                                       price: 140,
                                       isUrgent: false,
                                       category: Category(id: 1, name: "Véhicule")),
                         ListingEntity(image: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/2c9563bbe85f12a5dcaeb2c40989182463270404.jpg",
                                       title: "Statue homme noir assis en plâtre polychrome",
                                       date: "2019-11-05T15:56:59+0000",
                                       description: "Magnifique Statuette homme noir assis fumant le cigare en terre cuite et plâtre polychrome réalisée à la main.  Poids  1,900 kg en très bon état, aucun éclat  !  Hauteur 18 cm  Largeur : 16 cm Profondeur : 18cm  Création Jacky SAMSON  OPTIMUM  PARIS  Possibilité de remise sur place en gare de Fontainebleau ou Paris gare de Lyon, en espèces (heure et jour du rendez-vous au choix). Envoi possible ! Si cet article est toujours visible sur le site c'est qu'il est encore disponible",
                                       price: 140,
                                       isUrgent: false,
                                       category: Category(id: 4, name: "Maison")),
                         ListingEntity(image: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/2c9563bbe85f12a5dcaeb2c40989182463270404.jpg",
                                       title: "Statue homme noir assis en plâtre polychrome",
                                       date: "2019-11-05T15:56:59+0000",
                                       description: "Magnifique Statuette homme noir assis fumant le cigare en terre cuite et plâtre polychrome réalisée à la main.  Poids  1,900 kg en très bon état, aucun éclat  !  Hauteur 18 cm  Largeur : 16 cm Profondeur : 18cm  Création Jacky SAMSON  OPTIMUM  PARIS  Possibilité de remise sur place en gare de Fontainebleau ou Paris gare de Lyon, en espèces (heure et jour du rendez-vous au choix). Envoi possible ! Si cet article est toujours visible sur le site c'est qu'il est encore disponible",
                                       price: 140,
                                       isUrgent: false,
                                       category: Category(id: 4, name: "Maison"))]

}
