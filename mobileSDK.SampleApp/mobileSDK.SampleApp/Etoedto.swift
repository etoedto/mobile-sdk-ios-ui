//
//  Etoedto.swift
//  SampleApp
//
//  Created by Etoedto on 22.08.2022.
//

import Foundation
import EtoedtoSDK
import SwiftUI

func getBrandName() -> String {
    return String(#file.split(separator: "/").last?.split(separator: ".").first ?? "")
}

func getSDKVersionString() -> String {
    return Etoedto.sdkVersion
}

func getCoreVersionString() -> String {
    return Etoedto.coreVerion
}

let defaultPaymentData = PaymentData(
    primaryBrandColor: nil,
    secondaryBrandColor: nil,
    image: nil,
    projectId: 152533,
    paymentId: getUniquePaymentID(),
    paymentAmount: 123,
    paymentCurrency: "USD",
    customerId: "12",
    paymentDescription: "Test payment",
    languageCode: "",
    forcePaymentMethod: .none,
    hideSavedWallets: false,
    hideSuccessFinalPage: false,
    hideDeclineFinalPage: false,
    secretKey: "<YOUR_SECRET_KEY>",
    merchantId: "<YOUR_GOOGLE_PAY_MERCHANT_ID>",
    merchantName: "Example Merchant",
    mockModeType: MockModeType.disabled,
    regionCode: "",
    storedCardType: ""
)


extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
