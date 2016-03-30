
# Later

Make a synchronous operation synchronous. Abstracts away the details of dispatch_semaphore_wait et al. so you don't have to worry about it.

## Usage

    import Later
    
    let later = Later(3) // default delay is 5s
    
    someAsyncOperation() {
      
      // async operation is complete, so finish the later.
      later.done()
    }
    
    later.wait() // while the async operation is completing, let's chill for up to 3s

## Installation

### Swift Package Manager

Add Later to your `Package.swift` file:

    import PackageDescription

    let package = Package(
        name: "YourPackageName",
        dependencies: [
            .Package(url: "https://github.com/coryalder/Later.git", majorVersion: 0),
        ]
    )









