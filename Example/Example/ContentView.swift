//
//  ContentView.swift
//  Example
//
//  Created by Fumiya Tanaka on 2023/01/29.
//

import SwiftUI
import AVFoundation
import FloatingActionButton

struct ContentView: View {
    var body: some View {
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
            AudioServicesPlaySystemSound(1000)
        }
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
            AudioServicesPlaySystemSound(1000)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
