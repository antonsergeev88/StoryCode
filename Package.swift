// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "StoryCode",
    platforms: [
        .iOS(.v9),
    ],
    products: [
        .library(
            name: "StoryCode",
            targets: [
                "StoryCode",
            ]
        ),
    ],
    targets: [
        .target(
            name: "StoryCode",
            dependencies: [
            ],
            path: "StoryCode",
            exclude: [
                "Templates",
            ]
        ),
        .testTarget(
            name: "StoryCodeTests",
            dependencies: [
                "StoryCode",
            ],
            path: "StoryCodeTests"
        ),
    ]
)
