//
//  SignatureExamples.swift
//  SampleApp
//
//  Examples showing different signature generation approaches
//  Based on Android implementation patterns
//

import Foundation
import EtoedtoSDK

/// Examples demonstrating different signature generation approaches
/// Similar to Android ComposeActivity and XmlActivity examples
class SignatureExamples {
    
    /// Example 1: Using default signature parameters (most common case)
    /// Equivalent to Android: paymentInfo.getParamsForSignature(defaultParams)
    static func exampleDefaultSignature(paymentOptions: PaymentOptions, secretKey: String) {
        // Use default signature parameters - includes all standard payment fields
        paymentOptions.signature = SignatureHelper.generateSignature(
            paymentOptions: paymentOptions,
            secret: secretKey
        )
    }
    
    /// Example 2: Using the signature helper with property accessor
    /// Alternative approach using the signature property
    static func examplePropertyBasedSignature(paymentOptions: PaymentOptions, secretKey: String) {
        paymentOptions.signature = SignatureHelper.generateSignatureFromProperty(
            paymentOptions: paymentOptions,
            secret: secretKey
        )
    }
    
    /// Example 3: Direct method call without helper (recommended approach)
    /// Shows the direct approach similar to the current sample app
    static func exampleDirectCall(paymentOptions: PaymentOptions, secretKey: String) {
        let paramsToSign = paymentOptions.getParamsForSignature()
        paymentOptions.signature = signature(paramsToSign: paramsToSign, secret: secretKey)
    }
    
    /// Example 4: Using the backward-compatible property
    /// Shows how to use the existing paramsForSignature property
    static func exampleBackwardCompatible(paymentOptions: PaymentOptions, secretKey: String) {
        let paramsToSign = paymentOptions.paramsForSignature
        paymentOptions.signature = signature(paramsToSign: paramsToSign, secret: secretKey)
    }
    
    /// Example 5: Complete payment setup with signature generation
    /// Shows a full example similar to the Android implementation
    static func exampleCompleteSetup(
        projectId: Int32,
        paymentId: String,
        paymentAmount: Int64,
        paymentCurrency: String,
        secretKey: String
    ) -> PaymentOptions {
        
        // Create PaymentOptions (similar to Android PaymentInfo)
        let paymentOptions = PaymentOptions(
            projectID: projectId,
            paymentID: paymentId,
            paymentAmount: paymentAmount,
            paymentCurrency: paymentCurrency
        )
        
        // Generate signature using default parameters
        // Equivalent to Android: paymentInfo.getParamsForSignature(defaultParams)
        paymentOptions.signature = SignatureHelper.generateSignature(
            paymentOptions: paymentOptions,
            secret: secretKey
        )
        
        return paymentOptions
    }
}