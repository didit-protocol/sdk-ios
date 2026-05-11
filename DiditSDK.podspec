Pod::Spec.new do |s|
  s.name             = 'DiditSDK'
  s.version          = '3.5.1'
  s.summary          = 'Didit Identity Verification SDK for iOS'
  s.description      = <<-DESC
    The Didit SDK provides a complete identity verification solution including
    document scanning, NFC passport reading, face verification, and more.
  DESC

  s.homepage         = 'https://github.com/didit-protocol/sdk-ios'
  s.license          = {
    :type => 'MIT',
    :text => <<-LICENSE
MIT License

Copyright (c) 2025 Didit

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
  s.swift_version = '5.0'
  s.default_subspec = 'Full'
  s.source = {
    :http => 'https://github.com/didit-protocol/sdk-ios/releases/download/3.5.1/DiditSDK-CocoaPods.zip'
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
