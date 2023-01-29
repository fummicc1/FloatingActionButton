# FloatingActionButton (under development)

`FloatingActionButton` is a swift package that aims to show Floating Action Button for Material Design 3.

<img src="https://user-images.githubusercontent.com/44002126/215306177-bb5824fb-6b08-4dd8-a6a7-24d9f7244792.png" width=300px>



# Installation

Add below line to your `Package.swift`.

```swift
.package(url: "https://github.com/fummicc1/FloatingActionButton", .upToNextMajor(from: "0.0.1")),
```

and use `FloatingActionButton` library.

```swift
.product(name: "FloatingActionButton", package: "FloatingActionButton"),
```

# Sample

## FAB

```swift
FloatingActionable(
    .bottomTrailing,
    fab: .image(Image(systemName: "plus")),
    color: .red
) {
    Text("BottomTrailing FAB")
        .font(.largeTitle)
        .fontWeight(.medium)
        .padding()
} didPress: {
    // handle FAB action
}
```

<img src="https://user-images.githubusercontent.com/44002126/215306245-6ec42c56-b362-40c2-9511-dbf414aff4bd.PNG" width=300px>


## Extended FAB

```swift
FloatingActionable.extended(
    .bottomLeading,
    text: Text("subtract"),
    image: Image(systemName: "minus")
) {
    Text("Extended FAB")
        .font(.largeTitle)
        .fontWeight(.medium)
        .padding()
} didPress: {
    // handle FAB action
}
```

<img src="https://user-images.githubusercontent.com/44002126/215306286-9d285512-7b1d-4767-9b21-f540799ef81f.PNG" width=300px>



