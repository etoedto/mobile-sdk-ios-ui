//
//  EmptyTransformation.swift
//  mobileSDK.UI
//
//  Created by Etoedto on 25.07.2022.
//

import Foundation

/// Formatter that doing nothing
struct EmptyTransformation: CustomFormatterTransformation {
    func formattedString(from rawString: String) -> String {
        return rawString
    }

    func rawString(from formattedString: String) -> String {
        return formattedString
    }
}
