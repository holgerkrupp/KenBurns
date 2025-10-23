
import PackageDescription

let package = Package(
    name: "KenBurns",
    platforms: [
            .iOS(.v15),
            .macOS(.v12),
            .tvOS(.v15)
        ],
    products: [
        
        .library(
            name: "KenBurns",
            targets: ["KenBurns"]
        ),
    ],
    targets: [
      
        .target(
            name: "KenBurns"
        ),

    ]
)
