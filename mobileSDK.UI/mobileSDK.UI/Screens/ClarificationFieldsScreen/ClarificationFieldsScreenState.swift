//
//  ClarificationFieldsScreenState.swift
//  mobileSDK.UI
//
//  Created by Etoedto on 09.08.2022.
//

import Foundation

protocol ClarificationFieldsScreenState {
    var paymentOptions: PaymentOptions { get }
    var clarificationFields: [ClarificationField]? { get }
    var isVatIncluded: Bool { get }
}
