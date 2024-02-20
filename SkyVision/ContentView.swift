//
//  ContentView.swift
//  SkyVision
//
//  Created by Justin Edmund on 2/19/24.
//

import SwiftUI
import RealityKit
import RealityKitContent
import WebKit

struct ContentView: View {
    static let START_URL = "https://game.granbluefantasy.jp"
    
    @ObservedObject private var vm = WebViewModel(webResource: START_URL) // Now as @ObservedObject
    @State private var url: String = START_URL
    
    var body: some View {
        VStack {
            TextField("Enter a URL", text: $url)
                .textContentType(.URL)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
                .onChange(of: vm.currentURL) { newValue, original in
                    // Update the url state if the change was external (e.g., navigation)
                    url = newValue
                }
                .onSubmit {
                    vm.webResource = url
                    vm.loadWebPage()
                }
            
            WebView(viewModel: vm)
                .clipShape(RoundedRectangle(cornerRadius: 32.0, style: .continuous))
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
