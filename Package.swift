// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Actomaton-Gallery",
    platforms: [.macOS(.v12), .iOS(.v15), .watchOS(.v8), .tvOS(.v15)],
    products: [
        .library(
            name: "SwiftUI-Gallery",
            targets: ["Root", "DebugRoot"]),

        .library(
            name: "UIKit-Gallery",
            targets: ["TabUIKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/inamiy/Actomaton", .branch("main")),
        .package(url: "https://github.com/inamiy/OrientationKit", from: "0.1.0"),
        .package(url: "https://github.com/inamiy/SwiftUI-PhotoPicker", .branch("main")),
        .package(url: "https://github.com/nicklockwood/VectorMath", from: "0.4.1")
    ],
    targets: [
        .target(
            name: "Utilities",
            dependencies: []),
        .target(
            name: "CommonUI",
            dependencies: []),
        .target(
            name: "CanvasPlayer",
            dependencies: [
                .product(name: "ActomatonStore", package: "Actomaton"),
                "Utilities"
            ]),
        .target(
            name: "ImageLoader",
            dependencies: [.product(name: "ActomatonStore", package: "Actomaton")]),
        .target(
            name: "TimeTravel",
            dependencies: [.product(name: "ActomatonStore", package: "Actomaton")]),
        .target(
            name: "Counter",
            dependencies: [.product(name: "ActomatonStore", package: "Actomaton")]),
        .target(
            name: "SyncCounters",
            dependencies: [
                .product(name: "ActomatonStore", package: "Actomaton"),
                "Counter"
            ]),
        .target(
            name: "ColorFilter",
            dependencies: [
                .product(name: "ActomatonStore", package: "Actomaton"),
                .product(name: "PhotoPicker", package: "SwiftUI-PhotoPicker")
            ],
            resources: [.process("Resources/")]),
        .target(
            name: "Todo",
            dependencies: [.product(name: "ActomatonStore", package: "Actomaton")]),
        .target(
            name: "StateDiagram",
            dependencies: [.product(name: "ActomatonStore", package: "Actomaton")],
            resources: [.process("Resources/")]),
        .target(
            name: "Stopwatch",
            dependencies: [.product(name: "ActomatonStore", package: "Actomaton")]),
        .target(
            name: "GitHub",
            dependencies: [
                .product(name: "ActomatonStore", package: "Actomaton"),
                "Utilities", "CommonUI", "ImageLoader"
            ]),
        .target(
            name: "GameOfLife",
            dependencies: [
                .product(name: "ActomatonStore", package: "Actomaton"),
                "CommonUI", "CanvasPlayer"
            ],
            resources: [.copy("GameOfLife-Patterns/")]),
        .target(
            name: "VideoCapture",
            dependencies: [
                .product(name: "ActomatonStore", package: "Actomaton"),
                "OrientationKit"
            ]),
        .target(
            name: "VideoDetector",
            dependencies: [
                .product(name: "ActomatonStore", package: "Actomaton"),
                "VideoCapture"
            ]),
        .target(
            name: "Physics",
            dependencies: [
                .product(name: "ActomatonStore", package: "Actomaton"),
                "VectorMath",
                "CommonUI", "CanvasPlayer"
            ]),

        // MARK: - SwiftUI-Gallery

        .target(
            name: "Root",
            dependencies: [
                .product(name: "ActomatonStore", package: "Actomaton"),
                "Counter", "SyncCounters", "ColorFilter", "Todo", "StateDiagram", "Stopwatch", "GitHub",
                "GameOfLife", "VideoDetector", "Physics"
            ]),
        .target(
            name: "DebugRoot",
            dependencies: [
                .product(name: "ActomatonStore", package: "Actomaton"),
                "TimeTravel"
            ]),

        // MARK: - UIKit-Gallery

        .target(
            name: "ExampleListUIKit",
            dependencies: [
                .product(name: "ActomatonStore", package: "Actomaton"),
                "Counter", "SyncCounters", "ColorFilter", "Todo", "StateDiagram", "Stopwatch", "GitHub",
                "GameOfLife", "VideoDetector", "Physics"
            ],
            path: "Sources/UIKit/ExampleListUIKit"),

        .target(
            name: "TabUIKit",
            dependencies: [
                .product(name: "ActomatonStore", package: "Actomaton"),
                "ExampleListUIKit"
            ],
            path: "Sources/UIKit/TabUIKit")
    ]
)
