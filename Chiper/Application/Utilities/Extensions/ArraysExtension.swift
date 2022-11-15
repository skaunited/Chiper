//
//  ArraysExtension.swift
//  Chiper
//
//  Created by Skander Bahri on 15/11/2022.
//

import Foundation

public extension Array {
    func getOrNull(_ index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }
        return self[index]
    }
}
