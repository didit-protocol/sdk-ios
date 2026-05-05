Pod::Spec.new do |s|
  s.name             = 'DiditSDK'
  s.version          = '3.4.0'
  s.summary          = 'Didit Identity Verification SDK for iOS'
  s.description      = <<-DESC
    The Didit SDK provides a complete identity verification solution including
    document scanning, NFC passport reading, face verification, and more.
  DESC

  s.homepage         = 'https://github.com/didit-protocol/sdk-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Didit' => 'support@didit.me' }
  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'
  s.default_subspec = 'Full'
  s.source = {
    :http => 'https://github.com/didit-protocol/sdk-ios/releases/download/3.4.0/DiditSDK-CocoaPods.zip'
  }

  s.subspec 'Core' do |core|
    core.vendored_frameworks = 'Core/DiditSDK.xcframework'
    core.frameworks = 'UIKit', 'SwiftUI', 'AVFoundation', 'CoreLocation'
  end

  s.subspec 'Full' do |full|
    full.ios.deployment_target = '15.0'
    full.vendored_frameworks = 'Full/DiditSDK.xcframework', 'Full/OpenSSL.xcframework'
    full.frameworks = 'UIKit', 'SwiftUI', 'AVFoundation', 'CoreNFC', 'CoreLocation'
  end
end
