//
//  CardTypeRecognizer.swift
//  mobileSDK.UI
//
//  Created by Etoedto on 25.07.2022.
//

import Foundation

public protocol CardTypeRecognizer {
    func getCardType(for pan: String) -> PaymentMethodCard?
}
