# DiditSDK

A lightweight iOS SDK for identity verification. Server-driven, minimal configuration required.

## Requirements

- iOS 15.0+
- Xcode 15.0+
- Swift 5.9+

## Permissions

The SDK requires the following permissions. Add these to your app's Info.plist:

### Required Permissions

| Permission | Info.plist Key | Description |
|------------|----------------|-------------|
| Camera | `NSCameraUsageDescription` | Document scanning and face verification |
| Microphone | `NSMicrophoneUsageDescription` | Video recording for liveness checks |
| Photo Library | `NSPhotoLibraryUsageDescription` | Upload documents from device gallery |
| NFC | `NFCReaderUsageDescription` | Read NFC chips in passports/ID cards |
| Location | `NSLocationWhenInUseUsageDescription` | Geolocation for fraud prevention (optional) |

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
<key>NSLocationWhenInUseUsageDescription</key>
<string>Location access helps verify your identity and prevent fraud.</string>
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

## Installation

### Swift Package Manager (Recommended)

Add the package to your project using Xcode:

1. Go to **File > Add Package Dependencies**
2. Enter the repository URL:
   ```
   https://github.com/didit-protocol/didit-sdk-ios.git
   ```
3. Select the version and click **Add Package**

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/didit-protocol/didit-sdk-ios.git", from: "0.0.1")
]
```

### CocoaPods

Add the following to your `Podfile`:

```ruby
pod 'DiditSDK', :podspec => 'https://raw.githubusercontent.com/didit-protocol/didit-sdk-ios/main/DiditSDK.podspec'
```

Then run:

```bash
pod install
```

> **Note:** Open the `.xcworkspace` file (not `.xcodeproj`) after running `pod install`.

### Manual (XCFramework)

1. Download both frameworks from the [Releases](https://github.com/didit-protocol/didit-sdk-ios/releases) page:
   - `DiditSDK.xcframework.zip`
   - `OpenSSL.xcframework.zip`
2. Extract both zip files
3. Drag both `.xcframework` folders into your Xcode project
4. In your target's **General** tab, ensure both are listed under **Frameworks, Libraries, and Embedded Content**
5. Set the embed option to **Embed & Sign** for both frameworks

## Quick Start

### Step 1: Add the verification modifier to your view

```swift
import SwiftUI
import didit_sdk

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
    customIntroScreen: false,      // Use SDK's intro screen
    fontFamily: "Avenir",          // Custom font (must be registered in your app)
    loggingEnabled: true           // Enable debug logging
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
| `customIntroScreen` | `Bool` | `false` | Skip SDK's intro screen |
| `fontFamily` | `String?` | System font | Custom font family name |
| `loggingEnabled` | `Bool` | `false` | Enable SDK debug logging |

### Language Settings

The SDK supports 40+ languages. If no language is specified, the SDK uses the device locale with English fallback.

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
|----------|-------|----------|-------|
| English | `.english` | Korean | `.korean` |
| Arabic | `.arabic` | Lithuanian | `.lithuanian` |
| Bulgarian | `.bulgarian` | Latvian | `.latvian` |
| Bengali | `.bengali` | Macedonian | `.macedonian` |
| Catalan | `.catalan` | Malay | `.malay` |
| Czech | `.czech` | Dutch | `.dutch` |
| Danish | `.danish` | Norwegian | `.norwegian` |
| German | `.german` | Polish | `.polish` |
| Greek | `.greek` | Portuguese | `.portuguese` |
| Spanish | `.spanish` | Portuguese (Brazil) | `.portugueseBrazil` |
| Estonian | `.estonian` | Romanian | `.romanian` |
| Persian | `.persian` | Russian | `.russian` |
| Finnish | `.finnish` | Slovak | `.slovak` |
| French | `.french` | Slovenian | `.slovenian` |
| Hebrew | `.hebrew` | Serbian | `.serbian` |
| Hindi | `.hindi` | Swedish | `.swedish` |
| Croatian | `.croatian` | Thai | `.thai` |
| Hungarian | `.hungarian` | Turkish | `.turkish` |
| Armenian | `.armenian` | Ukrainian | `.ukrainian` |
| Indonesian | `.indonesian` | Uzbek | `.uzbek` |
| Italian | `.italian` | Vietnamese | `.vietnamese` |
| Japanese | `.japanese` | Chinese (Simplified) | `.chineseSimplified` |
| Georgian | `.georgian` | Chinese (Traditional) | `.chineseTraditional` |

## Advanced Options

### Contact Details (Prefill)

Provide contact details to prefill verification forms and enable notifications:

```swift
let contactDetails = ContactDetails(
    email: "user@example.com",
    sendNotificationEmails: true,  // Send status update emails
    emailLang: "en",               // Email language
    phone: "+14155552671"          // E.164 format
)

DiditSdk.shared.startVerification(
    workflowId: "your-workflow-id",
    contactDetails: contactDetails
)
```

### Expected Details (Cross-Validation)

Provide expected user details for cross-validation with extracted data:

```swift
let expectedDetails = ExpectedDetails(
    firstName: "John",
    lastName: "Doe",
    dateOfBirth: "1990-05-15",     // YYYY-MM-DD format
    nationality: "USA",            // ISO 3166-1 alpha-3
    country: "USA"
)

DiditSdk.shared.startVerification(
    workflowId: "your-workflow-id",
    expectedDetails: expectedDetails
)
```

### Metadata

Store custom JSON metadata with the session (not displayed to user):

```swift
DiditSdk.shared.startVerification(
    workflowId: "your-workflow-id",
    vendorData: "user-123",
    metadata: "{\"internalId\": \"abc123\", \"source\": \"mobile\"}"
)
```

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
import didit_sdk

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
        // Option A: With session token from your backend
        let config = DiditSdk.Configuration(languageLocale: .english)
        DiditSdk.shared.startVerification(
            token: "your-session-token",
            configuration: config
        )

        // Option B: With workflow ID (SDK creates session)
        // DiditSdk.shared.startVerification(
        //     workflowId: "your-workflow-id",
        //     vendorData: "user-123",
        //     contactDetails: ContactDetails(email: "user@example.com"),
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

## License

Copyright © 2025 Didit. All rights reserved.
