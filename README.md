# DiditSDK

A lightweight iOS SDK for identity verification. Server-driven, minimal configuration required.

## Requirements

- iOS 13.0+ (NFC passport reading requires iOS 15.0+)
- Xcode 15.0+
- Swift 5.9+

### iOS Version Compatibility

| iOS Version | Features Available |
|-------------|-------------------|
| iOS 13.0 - 14.x | All features **except** NFC passport reading |
| iOS 15.0+ | All features including NFC passport reading |

## SDK Variants

Starting with `4.0.0` the SDK is split into four installable variants so apps only pay the binary cost of features they actually use.

| Variant | NFC passport reading | MediaPipe auto-detection | Device-slice Mach-O | Use when |
|---------|----------------------|--------------------------|--------------------:|----------|
| `Core` | – | – | **~6 MB** | smallest footprint, manual capture only |
| `NFC` | ✓ | – | ~7 MB *(plus OpenSSL)* | passport chip reading without auto capture |
| `AutoDetection` | – | ✓ | ~37 MB | auto capture without passport chip reading |
| `All` | ✓ | ✓ | ~38 MB *(plus OpenSSL)* | every feature (default subspec) |

Numbers above are the `ios-arm64` slice Mach-O — the binary that actually ships in the IPA. MediaPipe (the auto-detection ML runtime) accounts for ~32 MB of that; picking `Core` or `NFC` removes it entirely and brings the SDK's IPA contribution to single-digit MB. NFC adds `NFCPassportReader` + `OpenSSL.xcframework`, both lightweight compared to MediaPipe. Sizes are measured against the 4.0.0 release and may shift by a few percent per release; the [Releases](https://github.com/didit-protocol/sdk-ios/releases) page records the authoritative numbers.

The `AutoDetection` and `NFC` subspecs depend on `Core`; `All` depends on both. Pick exactly one subspec in your `Podfile` and exactly one library product in your `Package.swift`.

## Permissions

The SDK requires the following permissions. Add these to your app's Info.plist:

### Required Permissions

| Permission | Info.plist Key | Description |
|------------|----------------|-------------|
| Camera | `NSCameraUsageDescription` | Document scanning and face verification |
| Microphone | `NSMicrophoneUsageDescription` | Video recording for liveness checks |
| Photo Library | `NSPhotoLibraryUsageDescription` | Upload documents from device gallery |
| NFC | `NFCReaderUsageDescription` | Read NFC chips in passports/ID cards (only if using NFC) |

### Example Info.plist Entries

```xml
<key>NSCameraUsageDescription</key>
<string>Camera access is required to scan your identity documents for verification.</string>
<key>NSMicrophoneUsageDescription</key>
<string>Microphone access is required to record video for liveness verification.</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Photo library access is required to upload document images.</string>
<key>NFCReaderUsageDescription</key>
<string>NFC access is required to read the chip in your identity document.</string>
```

### NFC Configuration (for passport/ID chip reading)

To enable NFC reading for passports and ID cards with chips:

1. **Add NFC Capability** in Xcode:
   - Select your target → Signing & Capabilities → + Capability → Near Field Communication Tag Reading

2. **Add ISO7816 Identifiers** to Info.plist:
   ```xml
   <key>com.apple.developer.nfc.readersession.iso7816.select-identifiers</key>
   <array>
       <string>D23300000045737445494420763335</string>
       <string>A0000002471001</string>
       <string>A0000002472001</string>
       <string>00000000000000</string>
   </array>
   ```

3. **Add Entitlements File** (*.entitlements) with TAG format:
   ```xml
   <key>com.apple.developer.nfc.readersession.formats</key>
   <array>
       <string>TAG</string>
   </array>
   ```

Skip this section unless you install the `NFC` or `All` variant.

### Important NFC Notes

> **Simulator Limitation:** The `NFC` and `All` variants link CoreNFC. Since Xcode 12, there is a bug where `libnfshared.dylib` is missing from simulators. Refer to [this Stack Overflow thread](https://stackoverflow.com/questions/63915728/xcode12-corenfc-simulator-library-not-loaded) for a solution to this problem. This does not apply to the `Core` or `AutoDetection` variants.

> **App Store Review:** If you install the `NFC` or `All` variant, Apple may ask you to provide a video demonstrating NFC usage because NFC-related code is part of the SDK binary. You can download a video demonstrating our NFC feature to submit to Apple here: [Download NFC Demo Video](https://business.didit.me/videos/passport-nfc.mp4)

## Installation

### Swift Package Manager

Add the package to your project using Xcode:

1. Go to **File > Add Package Dependencies**
2. Enter the repository URL:
   ```
   https://github.com/didit-protocol/sdk-ios.git
   ```
3. Select the version and click **Add Package**

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/didit-protocol/sdk-ios.git", from: "4.0.6")
],
targets: [
    .target(
        name: "YourApp",
        dependencies: [
            .product(name: "DiditSDK", package: "sdk-ios")
        ]
    )
]
```

Pick exactly one library product to match your chosen variant:

| Variant | SPM library product |
|---------|---------------------|
| `Core` | `DiditSDKCore` |
| `AutoDetection` | `DiditSDKAutoDetection` |
| `NFC` | `DiditSDKNFC` |
| `All` (default) | `DiditSDK` |

In all cases your app code imports the same module: `import DiditSDK`.

### CocoaPods

```ruby
podspec_url = 'https://raw.githubusercontent.com/didit-protocol/sdk-ios/main/DiditSDK.podspec'

platform :ios, '15.0'
pod 'DiditSDK/All',           :podspec => podspec_url
# pod 'DiditSDK/Core',          :podspec => podspec_url   # platform :ios, '13.0'
# pod 'DiditSDK/AutoDetection', :podspec => podspec_url   # platform :ios, '13.0'
# pod 'DiditSDK/NFC',           :podspec => podspec_url   # platform :ios, '15.0'
```

Pick exactly one subspec. `Core` and `AutoDetection` deploy down to iOS 13; `NFC` and `All` require iOS 15 because of `NFCPassportReader`.

Then run:

```bash
pod install
```

> **Note:** Open the `.xcworkspace` file (not `.xcodeproj`) after running `pod install`.

#### Xcode 15+ CocoaPods Build Errors

If you encounter rsync permission errors like `Operation not permitted` when building with CocoaPods on Xcode 15+, you need to disable User Script Sandboxing:

1. Open your project in Xcode
2. Select your **project** (not target) in the navigator
3. Go to **Build Settings**
4. Search for "User Script Sandboxing"
5. Set `ENABLE_USER_SCRIPT_SANDBOXING` to **No** for both Debug and Release

### Manual (XCFramework)

Each release publishes one XCFramework per variant. Pick the variant you want, download the zips from the [Releases](https://github.com/didit-protocol/sdk-ios/releases) page, and drag them into your Xcode project:

| Variant | Download |
|---------|----------|
| `Core` | `DiditSDK-Core.xcframework.zip` |
| `AutoDetection` | `DiditSDK-AutoDetection.xcframework.zip` |
| `NFC` | `DiditSDK-NFC.xcframework.zip` + `OpenSSL.xcframework.zip` |
| `All` | `DiditSDK.xcframework.zip` + `OpenSSL.xcframework.zip` |

Extract each zip and set the embed option to **Embed & Sign** under **Frameworks, Libraries, and Embedded Content**.

## Quick Start

### Step 1: Add the verification modifier to your view

```swift
import SwiftUI
import DiditSDK

struct ContentView: View {
    var body: some View {
        YourMainView()
            .diditVerification { result in
                switch result {
                case .completed(let session):
                    print("Session: \(session.sessionId)")
                    print("Status: \(session.status.rawValue)")
                    print("Country: \(session.country ?? "N/A")")
                    print("Document: \(session.documentType ?? "N/A")")
                case .cancelled(let session):
                    print("User cancelled - Session: \(session?.sessionId ?? "unknown")")
                case .failed(let error, let session):
                    print("Failed: \(error.localizedDescription)")
                    print("Session: \(session?.sessionId ?? "unknown")")
                }
            }
    }
}
```

### Step 2: Start verification

There are two ways to start the verification flow:

#### Option A: With existing session token (from your backend)

```swift
// Your backend creates the session and returns a token
DiditSdk.shared.startVerification(token: "your-session-token")
```

#### Option B: With workflow ID (SDK creates session)

```swift
// SDK creates the session using your workflow ID
DiditSdk.shared.startVerification(
    workflowId: "your-workflow-id",
    vendorData: "user-123"  // Optional: your user identifier
)
```

## Configuration

You can customize the SDK behavior using `DiditSdk.Configuration`:

```swift
let configuration = DiditSdk.Configuration(
    languageLocale: .spanish,      // Force Spanish language
    fontFamily: "Avenir",          // Custom font (must be registered in your app)
    loggingEnabled: true,          // Enable debug logging
    showCloseButton: true,         // Show close (X) button on step screens
    showExitConfirmation: true,    // Show confirmation dialog when user taps close
    closeOnComplete: false         // Don't auto-dismiss on completion
)

DiditSdk.shared.startVerification(
    token: "your-session-token",
    configuration: configuration
)
```

### Configuration Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `languageLocale` | `SupportedLanguage?` | Device locale | Force a specific language |
| `fontFamily` | `String?` | System font | Custom font family name (must be registered in Info.plist) |
| `loggingEnabled` | `Bool` | `false` | Enable SDK debug logging |
| `showCloseButton` | `Bool` | `true` | Show close (X) button on verification step screens |
| `showExitConfirmation` | `Bool` | `true` | Show confirmation dialog when user attempts to exit |
| `closeOnComplete` | `Bool` | `false` | Automatically dismiss verification UI when complete |

### Language Settings

The SDK supports 54 languages. If no language is specified, the SDK uses the device locale with English fallback.

```swift
// Use device locale (default)
let config = DiditSdk.Configuration()

// Force specific language
let config = DiditSdk.Configuration(languageLocale: .french)

// Detect device locale programmatically
let deviceLanguage = SupportedLanguage.fromDeviceLocale()
```

#### Supported Languages

| Language | Value | Language | Value |
|----------|------|----------|------|
| Albanian | `.albanian` | Kazakh | `.kazakh` |
| Arabic | `.arabic` | Korean | `.korean` |
| Armenian | `.armenian` | Kyrgyz | `.kyrgyz` |
| Bengali | `.bengali` | Latvian | `.latvian` |
| Bosnian | `.bosnian` | Lithuanian | `.lithuanian` |
| Bulgarian | `.bulgarian` | Macedonian | `.macedonian` |
| Catalan | `.catalan` | Malay | `.malay` |
| Chinese | `.chinese` | Montenegrin | `.montenegrin` |
| Chinese (Simplified) | `.chineseSimplified` | Norwegian | `.norwegian` |
| Chinese (Traditional) | `.chineseTraditional` | Persian | `.persian` |
| Croatian | `.croatian` | Polish | `.polish` |
| Czech | `.czech` | Portuguese | `.portuguese` |
| Danish | `.danish` | Portuguese (Brazil) | `.portugueseBrazil` |
| Dutch | `.dutch` | Romanian | `.romanian` |
| English | `.english` | Russian | `.russian` |
| Estonian | `.estonian` | Serbian | `.serbian` |
| Finnish | `.finnish` | Slovak | `.slovak` |
| French | `.french` | Slovenian | `.slovenian` |
| Georgian | `.georgian` | Somali | `.somali` |
| German | `.german` | Spanish | `.spanish` |
| Greek | `.greek` | Swedish | `.swedish` |
| Hebrew | `.hebrew` | Thai | `.thai` |
| Hindi | `.hindi` | Turkish | `.turkish` |
| Hungarian | `.hungarian` | Ukrainian | `.ukrainian` |
| Indonesian | `.indonesian` | Uzbek | `.uzbek` |
| Italian | `.italian` | Vietnamese | `.vietnamese` |
| Japanese | `.japanese` | Mongolian | `.mongolian` |

## Advanced Session Parameters

For advanced session parameters such as `contact_details`, `expected_details`, `metadata`, and `callback`, use the **Backend Session** method. Your backend calls [POST /v3/session/](https://docs.didit.me) with full parameters, then passes the `session_token` to the SDK:

```swift
// Your backend creates the session with all advanced parameters:
// POST /v3/session/ with contact_details, expected_details, metadata, etc.
// Then passes the session_token to the SDK:
DiditSdk.shared.startVerification(token: sessionTokenFromBackend)
```

> **Note:** The UniLink method (`startVerification(workflowId:)`) only supports `vendorData`. For any other session parameters, use the Backend Session method.

## Dismissing the Verification

The host app can end an active verification programmatically via `DiditSdk.shared.dismiss()`. This is the recommended way to tear down the verification when the host needs to take over the screen — for example, when the app is going to background.

```swift
DiditSdk.shared.dismiss()
```

`dismiss()` goes through the SDK's normal completion pipeline: it dismisses the presented UI, resets internal state, and invokes the `onComplete` callback with `.cancelled(session:)` carrying the current `sessionId` if a session was created. It is a no-op when no verification is active.

### Example: dismiss on app backgrounding

```swift
NotificationCenter.default.addObserver(
    forName: UIApplication.didEnterBackgroundNotification,
    object: nil,
    queue: .main
) { _ in
    DiditSdk.shared.dismiss()
}
```

> Do not set `DiditSdk.shared.isPresented = false` to dismiss — the flag only triggers presentation on its rising edge and setting it to `false` is a no-op. Likewise, calling `dismiss(animated:)` on the topmost view controller is not supported: it bypasses the SDK's completion pipeline so `onComplete` is never fired.

## Verification Results

The `VerificationResult` enum provides the outcome of the verification:

### Result Cases

| Case | Description |
|------|-------------|
| `.completed(session:)` | Verification flow completed (approved, pending, or declined) |
| `.cancelled(session:)` | User cancelled the verification flow |
| `.failed(error:session:)` | An error occurred during verification |

### SessionData

Each result includes a `SessionData` object:

| Property | Type | Description |
|----------|------|-------------|
| `sessionId` | `String` | The unique session identifier |
| `status` | `VerificationStatus` | Status: `.approved`, `.pending`, `.declined` |
| `country` | `String?` | Country code (ISO 3166-1 alpha-3) |
| `documentType` | `String?` | Document type used for verification |

### VerificationError

| Error | Description |
|-------|-------------|
| `.sessionExpired` | The session has expired |
| `.networkError` | Network connectivity issue |
| `.cameraAccessDenied` | Camera permission not granted |
| `.unknown(String)` | Other error with message |

### Example Usage

```swift
.diditVerification { result in
    switch result {
    case .completed(let session):
        switch session.status {
        case .approved:
            print("Approved! Session: \(session.sessionId)")
        case .pending:
            print("Under review. Session: \(session.sessionId)")
        case .declined:
            print("Declined. Session: \(session.sessionId)")
        }

    case .cancelled(let session):
        if let session = session {
            print("Cancelled session: \(session.sessionId)")
        }

    case .failed(let error, let session):
        print("Error: \(error.localizedDescription)")
    }
}
```

## Complete Example

```swift
import SwiftUI
import DiditSDK

struct HomeView: View {
    @State private var resultMessage: String?

    var body: some View {
        VStack(spacing: 24) {
            Button("Verify Identity") {
                startVerification()
            }
            .font(.headline)
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)

            if let message = resultMessage {
                Text(message)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
        }
        .diditVerification { result in
            handleResult(result)
        }
    }

    private func startVerification() {
        let config = DiditSdk.Configuration(
            languageLocale: .english,
            loggingEnabled: true,
            showCloseButton: true,
            showExitConfirmation: true,
            closeOnComplete: false
        )

        // Option A: With session token from your backend (recommended)
        DiditSdk.shared.startVerification(
            token: "your-session-token",
            configuration: config
        )

        // Option B: With workflow ID (SDK creates session)
        // DiditSdk.shared.startVerification(
        //     workflowId: "your-workflow-id",
        //     vendorData: "user-123",
        //     configuration: config
        // )
    }

    private func handleResult(_ result: VerificationResult) {
        switch result {
        case .completed(let session):
            resultMessage = """
                Completed
                Session: \(session.sessionId)
                Status: \(session.status.rawValue)
                Country: \(session.country ?? "N/A")
                Document: \(session.documentType ?? "N/A")
                """
        case .cancelled(let session):
            resultMessage = "Cancelled - Session: \(session?.sessionId ?? "unknown")"
        case .failed(let error, _):
            resultMessage = "Failed: \(error.localizedDescription)"
        }
    }
}
```

## Observing SDK State

You can observe the SDK state for custom UI:

```swift
struct CustomView: View {
    @ObservedObject private var sdk = DiditSdk.shared

    var body: some View {
        VStack {
            switch sdk.state {
            case .idle:
                Text("Ready to verify")
            case .creatingSession:
                ProgressView("Creating session...")
            case .loading:
                ProgressView("Loading...")
            case .ready:
                Text("Verification in progress")
            case .error(let message):
                Text("Error: \(message)")
            }
        }
    }
}
```

## Migrating from 3.x to 4.x

The install surface is split into four variants. Most integrations keep working without code changes; one path has a meaningful behavior change.

| Old (3.x) | New (4.x) | Action required |
|-----------|-----------|-----------------|
| `pod 'DiditSDK'` | `pod 'DiditSDK'` (resolves to `DiditSDK/All`) | none — same feature set as 3.x `DiditSDK/Full` |
| `pod 'DiditSDK/Full'` | `pod 'DiditSDK/All'` | rename the subspec |
| `pod 'DiditSDK/Core'` *(relying on auto capture)* | `pod 'DiditSDK/AutoDetection'` | rename the subspec — the 4.x `Core` variant drops MediaPipe and silently falls back to manual capture |
| `pod 'DiditSDK/Core'` *(manual capture only)* | `pod 'DiditSDK/Core'` | none — smaller binary, same behavior you had |
| SPM `.product(name: "DiditSDK", …)` | SPM `.product(name: "DiditSDK", …)` | none — still resolves to the `All` variant |
| SPM `.product(name: "DiditSDKCore", …)` *(relying on auto capture)* | SPM `.product(name: "DiditSDKAutoDetection", …)` | rename the product for the same reason as CocoaPods |
| SPM `.product(name: "DiditSDKCore", …)` *(manual capture only)* | SPM `.product(name: "DiditSDKCore", …)` | none |

`import DiditSDK` is unchanged in every case. Capture views still expose the same public API; the only observable difference in `Core` is that document/face screens skip the auto-capture countdown and require the shutter button.

## Changelog

### 4.1.0
- Native wallet-ownership verification flow (method picker, message signing, screenshot upload, self-declaration, satoshi/micro-deposit test, completion/expired) styled like the verification process, launched natively for the `wallet_ownership` action via the public `DiditSdk.presentWalletOwnership(widgetToken:)`.
- WalletConnect message signing behind an optional `DiditSDK/WalletConnect` subspec (reown-swift / ReownAppKit, iOS 15+): EVM `personal_sign` and Solana `solana_signMessage`, enabled with `DiditSdk.enableWalletConnect(projectId:appGroupIdentifier:)`. The core SDK stays iOS 13 and ships a no-op signer by default, so apps that don't need signing are unaffected.
- Transaction submission: native `submitTransaction` / `getTransaction`. A `wallet_ownership` required-action auto-launches the native flow; a `verification_session` action is returned on `result.actionRequired` (type, url, sessionId, sessionToken, status) for your existing `startVerification` / `.diditVerification` integration. Concurrent submissions are de-duplicated so a second call can't clobber an in-flight verification.
- New document quality-check screen validates the captured document (framing/crop) before it is uploaded.
- Full-color Didit logo on the verification welcome and wallet-ownership entry screens (the muted mark stays in the "Secured by" footer), and white-label logos now support SVG sources.
- Requests now send an `X-Didit-Device-Model` header (device model identifier) used for backend IP-analysis / device fingerprinting.
- Passive-liveness video is now recorded correctly on iPhone 17 / 17 Pro. These devices ship a portrait-mounted Center Stage front sensor that `AVCaptureMovieFileOutput` records in the wrong orientation; on iPhone 17-class hardware (`iPhone17,x` and newer) the SDK now records from the capture sample buffers with a matching sample-buffer preview, so the preview and the uploaded video are upright and correctly proportioned. Every earlier iPhone keeps the original recording path unchanged.
- Session-driven audio recording: document and passive-liveness capture now record audio only when the current session step requires it (a new per-step flag), and the microphone permission is requested on demand — steps that don't need audio never prompt.
- KYB company search now uses two separate fields, company name and registration number, instead of one unified query. Either field alone can search, both are sent for a combined lookup, and both are prefilled from the session's expected details; results, the US-state selector, and manual entry were updated to match.
- Backend-processing loader is fully synchronized with the verification WebView and stays on screen during the WebSocket → polling fallback, removing the flicker/desync between the web and native processing UIs.
- Document front-camera flow hardened: the anti-spoofing selfie is captured before the document camera starts (fixing a single-capture-session race that could silently skip the front-camera upload), a stalled capture can no longer hang the flow (resume-once timeout + guaranteed camera release), and repeated empty video segments fall back to a photo-only upload instead of looping the capture screen.
- KYB `kyb_key_people_ownership_required` is now honored on iOS, consent/start-screen legal links are tappable, and translations were refreshed.
- Fixes: passive liveness no longer gets stuck on the loading spinner after tapping "Continue"; front-camera document images are no longer mirrored on upload (with an instant un-mirrored confirmation frame and a capability-gated torch); the backend loader no longer flickers on passive-liveness success; the quality-check upload no longer drops recorded video segments; and the WalletConnect modal no longer crashes on device.

### 4.0.9
- Questionnaire: fields are now validated against their expected format before the step can be submitted, with a localized inline error message.
- Questionnaire: improved the inline validation error UI/UX for text, number, and text-area fields.
- Added internal front-camera orientation diagnostics (`LOG` telemetry) to investigate the iPhone 17 / Center Stage preview and recorded-video rotation. No public API or user-facing behavior change.

### 4.0.8
- KYB key people: the ownership percentage is now optional unless the session marks it required.
- Fix passive-liveness video recorded in landscape on iPhone 17 / 17 Pro / 17 Pro Max — the recording connection is now pinned to portrait (no-op on earlier devices).
- Fix the success/failure status texts shown after a face (liveness) upload.
- Fix the active-liveness face intro screen briefly appearing behind the processing/result overlay when the liveness WebView finishes.
- Document capture: detection corner guides are no longer drawn when auto-detection is unavailable (the Core/NFC variants, or when the detector fails to load).

### 4.0.7
- Add the Document AI verification step: prompts the user to upload the requested document(s) for AI-based data extraction, localized across all supported languages.
- KYB document upload now lists the fields the uploaded document must clearly show.
- Fix the KYB key-people close (X) button not opening the exit-confirmation modal.
- Align the SDK build to `NFCPassportReader 2.3.0` / `OpenSSL-Universal 3.3.3001`.

### 4.0.6
- Fix App Store rejection **ITMS-91061** (missing privacy manifest) and the sibling **ITMS-91065** (missing signature) for `Frameworks/OpenSSL.framework/OpenSSL`: `NFCPassportReader` is bumped `2.1.2 → 2.3.0`, which pulls `OpenSSL-Universal 3.3.3001` shipping its own `PrivacyInfo.xcprivacy` and code signature. The `OpenSSL.xcframework` source path in `build_xcframework.sh` was corrected for the OpenSSL 3.x pod layout. NFC chip reading was verified end-to-end on device. No public API change.
- KYB: company card, key people and associated parties, with key-people reuse across steps.
- KYB: US state selector in company search and confirmation.
- KYB: editable company country in the confirmation view; prefill key people when the preceding step is backend-only; email no longer required for key people when KYC isn't required for them.
- Fix KYB company select failing to advance on partial registry data.
- Fix the backend-processing loader getting stuck on the AML screening step.
- Fix the country flag not updating when changing the selected country, document preview rotation on the back-side scan, and the country/state picker search-icon visibility.
- Fix some countries showing the alpha-3 code instead of the country name; align start-screen feature icons with Android and web; UI polish in KYB views (button spacing/separator, phone country picker).
- Russian ID & passport document-override translations, plus a general translations refresh.

### 4.0.5
- Fix App Store rejection **ITMS-90338**: the `All` and `AutoDetection` xcframeworks no longer export MediaPipe's bundled native symbols (RE2, ICU, TensorFlow Lite, …) in their dyld export trie. The build now restricts exports to DiditSDK's own Swift/Objective-C API at link time (`-exported_symbols_list`) and verifies the export trie itself, so uploads are clear of the private-symbol collision (e.g. `re2::*`) that flagged 4.0.4. No source or API changes — same features and runtime behavior.
- Align every input and selector to the white-label tokens (background, text, placeholder, border-radius) so they match the document selector: text fields, OTP entry, dropdowns, country/phone pickers, and all questionnaire fields. Unselected radio buttons now use the selected color at reduced opacity instead of a hardcoded gray, so they stay visible on every theme.
- Align the KYB screens to the white-label tokens: the documents upload view, the key-people cards and editor, the awaiting-users view, and company search/results — fixing low-contrast text/icons, the status badges, and the "enter company data manually" link color.
- Fix passive-liveness uploads that could exceed the backend size limit: resized images are now rendered at scale 1 (they were silently inflated to the device's screen scale), and face-image compression now matches the web frontend (resize to a max dimension + binary-search JPEG to the target size).
- Add Algeria-specific NFC intro videos: when the document country is Algeria (`DZA`), the NFC chip-reading screen now plays the Algeria-specific instructional clip (`nfc-id-algeria` for ID-type documents, `nfc-passport-algeria` for passports). All other countries keep the standard `nfc-id` / `nfc-passport` videos.
- Resolve the NFC instructional video from the document's actual country: the SDK now reads the backend-detected `country` from the OCR response (falling back to the user-selected country, then the expected country), so the correct country video shows even when the country picked in the selector differs from the scanned document.
- Suppress the camera shutter sound on still capture (document capture, the anti-spoofing front-camera selfie, and passive liveness) on iOS 18+ where the device and local regulations allow it, via Apple's official `AVCapturePhotoSettings.isShutterSoundSuppressionEnabled`. Capture resolution and quality are unchanged; iOS 17 and earlier, and regions such as Japan/Korea, keep the system shutter (Apple provides no suppression there).
- Fix a stretched / incorrectly rotated front-camera preview and capture on newer devices (e.g. iPhone 17 Pro) by applying iOS 17's `RotationCoordinator` horizon-level rotation angle; scoped to the front camera so the rear document camera is unaffected.
- Fix the document capture screen tearing down a camera owned by a newer screen instance when the view is recreated, by tracking the active camera owner.

### 4.0.4
- Improve the post-active-liveness loader: on success the SDK now dismisses the liveness WebView immediately and shows the native processing/success sheet over an opaque background, then cross-fades into the next step — removing the residual blank/flash that could appear between active liveness and the next step.

### 4.0.3
- Add an active-liveness backend-processing loader: after the liveness step, whenever the session is still processing on the backend (`current_step_v2` != `current_step`), the SDK shows a full-screen "Verifying your details" overlay with rotating status messages, the feature step bar, and the "Secured by" footer, then transitions smoothly into the next step. Removes the brief black screen that could appear between active liveness and the next step. Messages are translated across all supported locales.
- Add support for the `Social Security Card` (`SSC`) OCR document type, so iOS shows the same document set as the web frontend (uses the ID-card capture aspect ratio), translated across all supported locales.
- Fix front-camera document capture being horizontally mirrored: the captured/uploaded document image is now un-mirrored on the front lens, while the live preview and selfie/liveness capture stay mirrored as before.
- Add proper retry error messaging for liveness and face-match failures, translated across all supported locales.
- Fix an active-liveness failure that could occur when the network (Wi-Fi) dropped during the liveness WebView flow.
- Remove the unused Location permission: the SDK no longer links `CoreLocation` or requests location, so integrators can drop `NSLocationWhenInUseUsageDescription` from their Info.plist.
- Emit a Tier-B device-class `composite_hash` fingerprint (`X-Didit-FP-Hash` header) for parity with the web SDK and backend device-identification contract.
- Build: strengthen third-party symbol hiding in `build_xcframework.sh` to keep App Store submissions clear of ITMS-90338.

### 4.0.2

- Add `Configuration.defaultDocumentCamera` and `Configuration.defaultLivenessCamera` (new public `CameraLens` enum: `.front` / `.back`) so apps can choose which physical lens opens first on each capture screen. Defaults: document `.back`, liveness `.front`. Falls back to the first available camera when the requested lens isn't present on the device.
- Add `Configuration.showDocumentCameraSwitchButton` and `Configuration.showLivenessCameraSwitchButton` (default `true`) to hide the in-capture camera switcher and lock the user to the chosen lens. The switcher is also automatically hidden on devices with only one camera, regardless of this flag.
- Add support for the `Tax Card` (`TC`) OCR document type so iOS now displays the same set of document cards as the web frontend. Includes the India `IND.taxCard` country override ("PAN Card (Permanent Account Number)") translated across all 54 supported locales, and a new `document-tax-card` vector asset.
- Honor the session-level `expected_document_types` whitelist (`P / ID / DL / RP / HIC / TC`) so a session that constrains the allowed document types now applies the same filter on iOS that the web frontend applies.
- Fix the selected-country / selected-document badges on the upload screen to use the white-label `bc-pill-text` token for the title text (was incorrectly using `bc-primary`). Brings the badge title in line with both the icon next to it and the document-selection card on the previous screen.
- Fix the manual capture button disappearing after the user switches the camera mid-session on the liveness (passive face) and document capture screens. The same delayed re-show timer used on first appear now also fires after each lens swap, matching the Android `LaunchedEffect(cameraManager)` behavior.

### 4.0.0

**Breaking change** — the install surface is now split into four variants. Existing CocoaPods integrations of `pod 'DiditSDK'` keep working (default subspec is `All`, which is identical in features to 3.x `DiditSDK/Full`); SPM consumers of `DiditSDK` also keep working (library product `DiditSDK` is the `All` variant). Existing integrations of `pod 'DiditSDK/Core'` or `.product(name: "DiditSDKCore", …)` keep working — but note that the 4.0 `Core` variant no longer ships MediaPipe, so apps that rely on auto capture must switch to `AutoDetection` (no NFC) or stay on the default `All`. See the [Migrating from 3.x to 4.x](#migrating-from-3x-to-4x) section above.

- Split the SDK into four installable variants: `Core` (no MediaPipe, no NFC, ~6 MB device-slice Mach-O), `AutoDetection` (MediaPipe only, ~37 MB), `NFC` (NFC reader only, ~7 MB + OpenSSL), `All` (everything, default, ~38 MB + OpenSSL). This responds to client feedback that the 3.x ~38 MB binary triggered Apple's WiFi-only download warning on cellular; consumers that do not need auto capture can drop ~84% of the SDK's binary footprint by switching to `Core`.
- Auto-detection sources (`DocumentDetector`, `FaceDetector`, `ModelDownloader`, and the manager classes) now self-gate with `#if canImport(MediaPipeTasksVision)`. Variants without MediaPipe still compile and fall back to manual shutter capture without functional regression beyond losing the auto-capture timer overlay.
- Add Mongolian (`mn`) localization in `SupportedLanguage.mongolian` with full coverage of every SDK string.
- Includes all fixes from 3.6.1/3.6.2 (iPhone X EXC_BAD_ACCESS on Continue, Mongolian localization).

### 3.6.2
- Add Mongolian (`mn`) localization. Available via `SupportedLanguage.mongolian` or device locale `mn-MN`. Coverage is sourced from the web verification frontend; iOS-only strings (NFC reader UI, native upload sheet, exit-confirmation alert) fall back to English and can be hand-translated later.
- Includes all fixes from 3.6.1 (iOS 13-17 EXC_BAD_ACCESS on Continue, built without the Swift 6.0+ runtime symbol `swift_getExtendedFunctionTypeMetadata`).

### 3.6.1
- Fix `EXC_BAD_ACCESS` crash on iPhone X and other devices stuck on iOS 13-17 immediately after tapping "Continue" on the start screen (3.6.0 binary imported `swift_getExtendedFunctionTypeMetadata`, a Swift 6.0+ runtime symbol unavailable before iOS 18)
- Build with `SWIFT_APPROACHABLE_CONCURRENCY=NO` and explicit `-disable-upcoming-feature` flags so Xcode 26.x toolchains stop emitting Swift 6.x metadata calls; binary is now back-deploy safe to iOS 13
- Add hard-fail back-deploy verification step (`Step 9`) to `build_xcframework.sh` so a regression cannot be published again
- No source/API changes, no behavior changes: same release as 3.6.0 with corrected build configuration

### 3.6.0
- Add public `DiditSdk.shared.dismiss()` to programmatically end an active verification from the host app (e.g. on app backgrounding). Funnels through the SDK's completion pipeline and invokes `onComplete` with `.cancelled(session:)`
- Fix questionnaire whitelabel colors in checkbox, radio, and dropdown to use `panel` / `pillText` tokens (matches web `bc-panel` / `bc-pill-text` instead of `button1` / `primary`)

### 3.4.1
- Fix CocoaPods binary podspec license metadata by inlining the MIT license text
- Uses the same SDK binaries as 3.4.0

### 3.4.0
- Add optional no-NFC install variants for apps that do not need NFC dependencies: CocoaPods `DiditSDK/Core` and Swift Package Manager `DiditSDKCore`
- Keep the default `DiditSDK` installation NFC-enabled through `DiditSDK/Full`
- Fix NFC step routing in mixed CocoaPods integrations by detecting the `NFCPassportReader` module at compile time
- Document NFC capability, entitlement, and provisioning requirements

### 3.3.4
- Improve step recovery after interrupted or failed backend responses
- Fix verification flow getting stuck after upload fallback recovery

### 3.3.3
- Improve document camera capture quality and upload image readability
- Fix document scan video segments by finalizing recorder state and exporting playable MP4/H.264 uploads
- Add iOS SDK version/integration metadata and camera/video error LOG events
- Improve passive liveness recommendation text color consistency

### 3.3.2
- Fix active liveness WebView language: pass SDK locale in URL path

### 3.3.1
- Add KYB translations for all 52 supported languages (synced from web locales)

### 3.3.0
- Add native KYB flow on iOS, including company search, manual entry, associated parties, document upload, and processing screens
- Update verification UI components and step/progress styling
- Add Kazakh language support and expand KYB/session translations
- Add KYB/session models, API fields, and status handling for the new flow

### 3.2.11
- Fix PDF file upload in questionnaire on iOS 26 (use modern UTType document picker API with iOS 13 fallback)
- Fix document picker silently skipping files when security-scoped resource access returns false
- Apply same UTType fix to proof-of-address document picker

### 3.2.13
- Pin dependency versions to prevent breaking upgrades (MediaPipeTasksVision 0.10.21, NFCPassportReader 2.1.2)

### 3.2.12
- Face area threshold adjusted to 9% for optimal distance balance

### 3.2.11
- Tighten face detection thresholds for better capture quality
- Require tight stability only for auto-capture (no more loose threshold)
- Stricter frontal face check (nose offset 0.25, eye level 0.30)
- Tighter position bands (32% horizontal, 48% vertical)
- Higher ML confidence threshold (0.85)
- Longer hold time (1.0s, 25 consecutive frames)

### 3.2.10
- Fix keyboard overlapping questionnaire inputs (use safeAreaInset for footer)
- Fix tap-to-focus requiring double tap on inputs (replace simultaneousGesture with UIKit tap recognizer)
- Add scroll-to-dismiss keyboard on questionnaire (scrollDismissesKeyboard)

### 3.2.9
- Hide internal C++ symbols (OpenCV, MediaPipe, TFLite) to prevent linker collisions with other SDKs
- Per-architecture symbol hiding using nmedit for fat binary compatibility

### 3.2.8
- Fix SPM/Xcode 26 Archive failure: use plain zip instead of ditto to avoid __MACOSX metadata that breaks signature seal on extraction
- Verified: `codesign --verify --deep --strict` passes after both `unzip` and `ditto` extraction

### 3.2.7
- Fix XCFramework signature seal consistency (resolves Xcode 26 Archive failure with `signature-collection failed`)
- Remove stale code signatures before re-signing after bitcode stripping
- Use `ditto` for zip archives to preserve code signature metadata
- Add `--deep` signing and post-sign verification to build script

### 3.2.6
- Sign inner .framework binaries within each XCFramework slice (fixes Xcode 26 Archive failure and ITMS-91065 for ios-arm64)

### 3.2.5
- Add missing exit confirmation dialog translations for all 51 languages

### 3.2.4
- Signed XCFrameworks with Apple Distribution certificate (fixes ITMS-91065: Missing signature on App Store submission)
- Force portrait orientation within the SDK regardless of host app settings
- Fix consecutive same-type verification steps (e.g. liveness -> liveness) getting stuck
- Fix "Continue" button becoming unresponsive on step screens due to coordinator re-initialization
- Add missing language translations (Albanian, Bosnian, Kyrgyz)
- Fix Configuration documentation (add showCloseButton, showExitConfirmation, closeOnComplete; remove incorrect parameters)

### 3.2.3
- Previous release

## License

Copyright © 2026 Didit. All rights reserved.
