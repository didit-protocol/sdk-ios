Pod::Spec.new do |s|
  s.name             = 'DiditSDK'
  s.version          = '0.0.2'
  s.summary          = 'Didit Identity Verification SDK for iOS'
  s.description      = <<-DESC
    The Didit SDK provides a complete identity verification solution including
    document scanning, NFC passport reading, face verification, and more.
  DESC

  s.homepage         = 'https://github.com/didit-protocol/didit-sdk-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Didit' => 'support@didit.me' }
  s.source           = { 
    :http => 'https://github.com/didit-protocol/didit-sdk-ios/releases/download/0.0.2/DiditSDK.xcframework.zip'
  }

  s.ios.deployment_target = '15.0'
  s.swift_version = '5.0'
  
  # Use the pre-built XCFramework
  s.vendored_frameworks = 'DiditSDK.xcframework'
  
  # Dependencies - users need to install these
  s.dependency 'NFCPassportReader', '~> 2.3'
  
  # Required frameworks
  s.frameworks = 'UIKit', 'SwiftUI', 'AVFoundation', 'CoreNFC', 'CoreLocation'
end
