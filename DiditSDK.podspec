Pod::Spec.new do |s|
  s.name             = 'DiditSDK'
  s.version          = '4.13.2'
  s.summary          = 'Didit Identity Verification SDK for iOS'
  s.description      = <<-DESC
    Modular identity verification SDK. Every verification variant (Core, NFC,
    All) includes auto capture through the Didit tiny detectors. Install Core
    for the smallest build, NFC for passport chip reading, or All for the
    complete feature set; AutoDetection is deprecated and identical to Core.
    Core-Location, NFC-Location and All-Location are those variants with the
    Location verification step (Core Location). Auth is authentication on its
    own (DiditAuth) and Signals is device signals and event submission on their
    own, with no verification UI; every verification variant includes both.
  DESC

  s.homepage         = 'https://github.com/didit-protocol/sdk-ios'
  s.license          = {
    :type => 'MIT',
    :text => <<-LICENSE
MIT License

Copyright (c) 2026 Didit

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
    LICENSE
  }
  s.author           = { 'Didit' => 'support@didit.me' }
  s.ios.deployment_target = '13.0'
  s.swift_version    = '5.0'
  s.default_subspec  = 'All'
  s.source = {
    :http => "https://github.com/didit-protocol/sdk-ios/releases/download/#{s.version}/DiditSDK-CocoaPods.zip"
  }

  shared_frameworks      = ['UIKit', 'SwiftUI', 'AVFoundation']
  passport_frameworks    = ['CoreNFC']
  location_frameworks    = ['CoreLocation']

  s.subspec 'Core' do |core|
    core.vendored_frameworks = 'Core/DiditSDK.xcframework'
    core.frameworks          = shared_frameworks
  end

  s.subspec 'AutoDetection' do |auto|
    auto.vendored_frameworks = 'AutoDetection/DiditSDK.xcframework'
    auto.frameworks          = shared_frameworks
  end

  s.subspec 'NFC' do |nfc|
    nfc.ios.deployment_target = '15.0'
    nfc.vendored_frameworks   = 'NFC/DiditSDK.xcframework', 'NFC/OpenSSL.xcframework'
    nfc.frameworks            = shared_frameworks + passport_frameworks
  end

  s.subspec 'All' do |all|
    all.ios.deployment_target = '15.0'
    all.vendored_frameworks   = 'All/DiditSDK.xcframework', 'All/OpenSSL.xcframework'
    all.frameworks            = shared_frameworks + passport_frameworks
  end

  # The verification variants with the Location module compiled in (the INCLUDE_LOCATION=true
  # builds): Core Location linked, and the module's privacy manifest in every framework slice.
  # Each replaces its plain variant, like every subspec here: pick exactly one.
  s.subspec 'Core-Location' do |core|
    core.vendored_frameworks = 'Core-Location/DiditSDK.xcframework'
    core.frameworks          = shared_frameworks + location_frameworks
  end

  s.subspec 'NFC-Location' do |nfc|
    nfc.ios.deployment_target = '15.0'
    nfc.vendored_frameworks   = 'NFC-Location/DiditSDK.xcframework', 'NFC-Location/OpenSSL.xcframework'
    nfc.frameworks            = shared_frameworks + passport_frameworks + location_frameworks
  end

  s.subspec 'All-Location' do |all|
    all.ios.deployment_target = '15.0'
    all.vendored_frameworks   = 'All-Location/DiditSDK.xcframework', 'All-Location/OpenSSL.xcframework'
    all.frameworks            = shared_frameworks + passport_frameworks + location_frameworks
  end

  # Device signals and event submission on their own, with no verification UI:
  # `import DiditSDK`, then `DiditSignals`.
  s.subspec 'Signals' do |signals|
    signals.vendored_frameworks = 'Signals/DiditSDK.xcframework'
    signals.frameworks          = ['UIKit', 'AVFoundation', 'CryptoKit', 'DeviceCheck', 'Security']
  end

  # Authentication on its own: `import DiditAuth`.
  s.subspec 'Auth' do |auth|
    auth.ios.deployment_target = '15.0'
    auth.vendored_frameworks   = 'Auth/DiditAuth.xcframework'
    auth.frameworks            = ['UIKit', 'AVFoundation', 'AuthenticationServices', 'CryptoKit', 'DeviceCheck', 'Security']
  end
end
