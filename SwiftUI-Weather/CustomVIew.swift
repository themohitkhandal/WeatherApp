//
//  CustomVIew.swift
//  SwiftUI-Weather
//
//  Created by Anurag Bajpai on 28/07/23.
//

import SwiftUI

struct CustomVIew: View {
    @State private var navigationPath: [Int] = []
        
        var body: some View {
            
            NavigationStack(path: $navigationPath ) {
                VStack {
                    Image(systemName: "globe")
                    Text("Hello, world!")
                }
                // defines destinations of path
                .navigationDestination(for: Int.self, destination: { value in
                    switch value {
                    case 1: Text("Screen 1")
                    case 2: Text("Screen 2")
                    default: Text("unknown view")
                    }
                })
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationLink("Button 1", value: 1)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink("Button 2", value: 2)
                    }
                }
            }
            
            .safeAreaInset(edge: .bottom, spacing: 0) {
                HStack {
                    Button("Button 1") {
                        navigationPath = [1]
                        // or if you want to extend the path:
                        // navigationPath.append(1)
                    }
                    .frame(maxWidth: .infinity)
                    Button("Button 2") {
                        navigationPath = [2]
                        // or if you want to extend the path:
                        // navigationPath.append(2)
                   }
                    .frame(maxWidth: .infinity)
                }
                .padding()
                .background(.regularMaterial)
            }
        }
}

struct CustomVIew_Previews: PreviewProvider {
    static var previews: some View {
        CustomVIew()
    }
}
