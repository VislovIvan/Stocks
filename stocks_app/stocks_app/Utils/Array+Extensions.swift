//
//  stocks_appApp.swift
//  Array+Extensions
//
//  Created by Ivan Vislov on 23.03.2021.
//

import Foundation

extension Array where Element: Hashable {
    func difference(from other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))
    }
}
