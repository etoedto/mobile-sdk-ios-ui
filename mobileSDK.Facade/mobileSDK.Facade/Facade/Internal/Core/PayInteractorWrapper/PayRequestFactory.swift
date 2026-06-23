//
//  PayRequestFactory.swift
//  etoedtoSDK
//
//  Created by Etoedto on 25.07.2022.
//

#if !DEVELOPMENT
@_implementationOnly import mobileSDK_UI
@_implementationOnly import MsdkCore
#else
import mobileSDK_UI
import MsdkCore
#endif

class PayRequestFactory: mobileSDK_UI.PayRequestFactory {
    func createSBPSaleRequest() -> any mobileSDK_UI.PayRequest {
        PayRequestWrapper(coreRequest: SbpSaleRequest())
    }
    
    func createSavedCardSaleRequest(
        cvv: String,
        accountId: Int64,
        recipientInfo: mobileSDK_UI.RecipientInfo?
    ) -> mobileSDK_UI.PayRequest {
        let request = SavedCardSaleRequest(cvv: cvv, accountId: accountId)

        request.recipientInfo = recipientInfo?.coreRecipientInfo

        return PayRequestWrapper(coreRequest: request)
    }
    
    func createSavedCardAuthRequest(
        cvv: String,
        accountId: Int64,
        recipientInfo: mobileSDK_UI.RecipientInfo?
    ) -> mobileSDK_UI.PayRequest {
        let request = SavedCardAuthRequest(cvv: cvv, accountId: accountId)

        request.recipientInfo = recipientInfo?.coreRecipientInfo

        return PayRequestWrapper(coreRequest: request)
    }

    func createNewCardSaleRequest(
        cvv: String,
        pan: String,
        year: Int32,
        month: Int32,
        cardHolder: String,
        saveCard: Bool,
        storedCardType: Int32?,
        recipientInfo: mobileSDK_UI.RecipientInfo?
    ) -> mobileSDK_UI.PayRequest {
        let request = NewCardSaleRequest(
            cvv: cvv,
            pan: pan,
            expiryDate: CardDate(month: month, year: year),
            cardHolder: cardHolder,
            saveCard: saveCard,
            storedCardType: storedCardType != nil
                ? StoredCardType.companion.from(value: KotlinInt(int: storedCardType!))
                : nil,
            recipientInfo: recipientInfo?.coreRecipientInfo
        )

        return PayRequestWrapper(coreRequest: request)
    }
    
    func createNewCardAuthRequest(
        cvv: String,
        pan: String,
        year: Int32,
        month: Int32,
        cardHolder: String,
        saveCard: Bool,
        storedCardType: Int32?,
        recipientInfo: mobileSDK_UI.RecipientInfo?
    ) -> mobileSDK_UI.PayRequest {
        let request = CardAuthRequest(
            cvv: cvv,
            pan: pan,
            expiryDate: CardDate(month: month, year: year),
            cardHolder: cardHolder,
            saveCard: saveCard,
            storedCardType: storedCardType != nil
                ? StoredCardType.companion.from(value: KotlinInt(int: storedCardType!))
                : nil
        )

        request.recipientInfo = recipientInfo?.coreRecipientInfo

        return PayRequestWrapper(coreRequest: request)
    }

    func createTokenizeSaleRequest(
        cvv: String,
        recipientInfo: mobileSDK_UI.RecipientInfo?
    ) -> mobileSDK_UI.PayRequest {
        let request = CardSaleTokenizeRequest(cvv: cvv)

        request.recipientInfo = recipientInfo?.coreRecipientInfo

        return PayRequestWrapper(coreRequest: request)
    }

    func createTokenizeAuthRequest(
        cvv: String,
        recipientInfo: mobileSDK_UI.RecipientInfo?
    ) -> mobileSDK_UI.PayRequest {
        let request = CardAuthTokenizeRequest(cvv: cvv)

        request.recipientInfo = recipientInfo?.coreRecipientInfo

        return PayRequestWrapper(coreRequest: request)
    }

    func createApplePaySaleRequest(
        token: String,
        recipientInfo: mobileSDK_UI.RecipientInfo?
    ) -> mobileSDK_UI.PayRequest {
        #if targetEnvironment(simulator) && DEBUG && DEVELOPMENT
        let request = ApplePaySaleRequest(token: debugToken)
        #else
        let request = ApplePaySaleRequest(token: token)
        #endif

        request.recipientInfo = recipientInfo?.coreRecipientInfo
        
        return PayRequestWrapper(coreRequest: request)
    }

    func createApplePayAuthRequest(
        token: String,
        recipientInfo: mobileSDK_UI.RecipientInfo?
    ) -> mobileSDK_UI.PayRequest {
        #if targetEnvironment(simulator) && DEBUG && DEVELOPMENT
        let request = ApplePayAuthRequest(token: debugToken)
        #else
        let request = ApplePayAuthRequest(token: token)
        #endif

        request.recipientInfo = recipientInfo?.coreRecipientInfo

        return PayRequestWrapper(coreRequest: request)
    }

    func createAPSSaleRequest(methodCode: String) -> mobileSDK_UI.PayRequest {
        PayRequestWrapper(coreRequest: ApsSaleRequest(methodCode: methodCode))
    }

    func createPaymentRestoreRequest(methodCode: String) -> mobileSDK_UI.PayRequest {
        PayRequestWrapper(coreRequest: PaymentRestoreRequest())
    }
    
    func createTokenizeRequest(
        pan: String,
        month: Int32,
        year: Int32,
        cardHolder: String
    ) -> mobileSDK_UI.PayRequest {
        let request = CardTokenizeRequest(
            pan: pan,
            expiryDate: CardDate(month: month, year: year),
            cardHolder: cardHolder
        )

        return PayRequestWrapper(coreRequest: request)
    }

    func createVerifyCardRequest(
        cvv: String,
        pan: String,
        year: Int32,
        month: Int32,
        cardHolder: String,
        storedCardType: Int32?
    ) -> mobileSDK_UI.PayRequest {
        let request = CardVerifyRequest(
            cvv: cvv,
            pan: pan,
            expiryDate: CardDate(month: month, year: year),
            cardHolder: cardHolder,
            storedCardType: storedCardType != nil
                ? StoredCardType.companion.from(value: KotlinInt(int: storedCardType!))
                : nil
        )

        return PayRequestWrapper(coreRequest: request)
    }

    func createVerifyApplePayRequest(
        token: String
    ) -> mobileSDK_UI.PayRequest {
        #if targetEnvironment(simulator) && DEBUG && DEVELOPMENT
        let request = ApplePayVerifyRequest(token: debugToken)
        #else
        let request = ApplePayVerifyRequest(token: token)
        #endif

        return PayRequestWrapper(coreRequest: request)
    }
}

internal struct PayRequestWrapper: mobileSDK_UI.PayRequest {
    let coreRequest: MsdkCore.PayRequest

    func fillCustomerFields(customerFields: [FieldValue]) {
        coreRequest.customerFields = customerFields.map {
            MsdkCore.CustomerFieldValue(name: $0.name, value: $0.value)
        }
    }
}

#if targetEnvironment(simulator) && DEBUG && DEVELOPMENT
// Provide your own Apple Pay test token payload here for simulator debugging.
private let debugToken = "<YOUR_APPLE_PAY_DEBUG_TOKEN>"
#endif
