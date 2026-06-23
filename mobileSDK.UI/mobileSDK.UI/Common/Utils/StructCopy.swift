//
//  StructCopy.swift
//  mobileSDK.UI
//
//  Created by Etoedto on 15.08.2022.
//

import Foundation
import SwiftUI

typealias ModifyTransaction<T> = (_  value: inout T) -> Void

func modifiedCopy<T>(of initialValue: T, by transaction: ModifyTransaction<T>) -> T {
    var copy = initialValue
    transaction(&copy)
    return copy
}
