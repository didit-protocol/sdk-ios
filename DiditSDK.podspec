Pod::Spec.new do |s|
  s.name             = 'DiditSDK'
  s.version          = '4.0.4'
  s.summary          = 'Didit Identity Verification SDK for iOS'
  s.description      = <<-DESC
    Modular identity verification SDK. Install Core for the bare minimum,
    add AutoDetection for MediaPipe-based auto capture, add NFC for passport
    chip reading, or install All for the complete feature set.
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
end
