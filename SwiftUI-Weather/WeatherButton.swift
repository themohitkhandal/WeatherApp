//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Mohit Khandal on 28/07/23.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    
    var body: some View {
        Button {
            
        } label: {
            Text(title)
                .frame(width: 280, height: 50 )
                .foregroundColor(textColor)
                .font(.system(size: 20, weight: .bold, design: .default))
                .background(backgroundColor)
                .cornerRadius(10)
                
        }
    }
}

