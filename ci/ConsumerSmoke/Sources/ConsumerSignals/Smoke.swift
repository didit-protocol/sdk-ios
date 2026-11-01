import DiditSDK

// The import above IS the test: it compiles the binary framework's
// .swiftinterface, which is what broke for every consumer in 4.7.0
// ("no such module 'TensorFlowLite'"). Kept API-free on purpose so this file
// never needs updating alongside SDK releases.
