#
#  Be sure to run `pod spec lint EtoedtoSDK_UI.podspec` to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name         = "EtoedtoSDK_UI"
  spec.version      = "3.10.1"
  spec.summary      = "Etoedto SDK with UI for iOS"

  spec.description  = "SDK for iOS is a software development kit for fast integration of the Etoedto payment solutions right in your mobile app for iOS."
  spec.homepage     = "https://github.com/etoedto/mobile-sdk-ios-ui"
  spec.license      = "MIT"

  spec.authors      = { "Etoedto" => "" }

  spec.platform     = :ios
  spec.ios.deployment_target = "15.6"

  spec.source       = { :http => "https://github.com/etoedto/mobile-sdk-ios-ui/releases/download/#{spec.version}/etoedtoSDK.xcframework.zip" }

  spec.ios.vendored_frameworks = 'etoedtoSDK.xcframework'

end
