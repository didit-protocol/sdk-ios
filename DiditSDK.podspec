Pod::Spec.new do |s|
  s.name             = 'DiditSDK'
  s.version          = '3.1.0'
  s.summary          = 'Didit Identity Verification SDK for iOS'
  s.description      = <<-DESC
    The Didit SDK provides a complete identity verification solution including
    document scanning, NFC passport reading, face verification, and more.
  DESC

  s.homepage         = 'https://github.com/didit-protocol/sdk-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Didit' => 'support@didit.me' }
  s.source           = {
    :http => 'https://github.com/didit-protocol/sdk-ios/releases/download/3.1.0/DiditSDK-CocoaPods.zip'
  }

  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'

  # Use the pre-built XCFrameworks (includes OpenSSL for NFC)
  s.vendored_frameworks = 'DiditSDK.xcframework', 'OpenSSL.xcframework'

  # Required frameworks
  s.frameworks = 'UIKit', 'SwiftUI', 'AVFoundation', 'CoreNFC', 'CoreLocation'
end
