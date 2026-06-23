//
//  SignatureHelper.swift
//  SampleApp
//
//  Helper class for signature generation
//  Similar to Android SignatureGenerator implementation
//

import Foundation
import EtoedtoSDK

/// Helper class for signature generation
/// Provides a clean interface similar to the Android implementation
class SignatureHelper {
    
    /// Generate signature using default signature parameters
    /// Equivalent to Android: paymentInfo.getParamsForSignature(defaultParams)
    static func generateSignature(paymentOptions: PaymentOptions, secret: String) -> String {
        let paramsToSign = paymentOptions.getParamsForSignature()
        return signature(paramsToSign: paramsToSign, secret: secret)
    }
    
    /// Generate signature using backward-compatible property
    /// This method provides the same functionality as the property accessor
    static func generateSignatureFromProperty(paymentOptions: PaymentOptions, secret: String) -> String {
        let paramsToSign = paymentOptions.paramsForSignature
        return signature(paramsToSign: paramsToSign, secret: secret)
    }
}