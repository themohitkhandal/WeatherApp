//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Mohit Khandal on 28/07/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var data : [WeatherDataObj] = WeatherData.data
    
   
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                
                CityTextView(cityName: "Jaipur, India")
                MainWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: isNight ? 26 : 32)
                
                
                
                HStack(spacing: 20) {
                    ForEach(data) { value in
                        WeatherDayView(dayOfWeek: value.dayName, imageName: value.imageName, temperature: value.temperature)
                                }
                }
                Spacer()

                Button {
                    isNight.toggle()
                    print(data)
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50 )
                        .foregroundColor(.blue)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .background(.white)
                        .cornerRadius(10)
                        
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek:String
    var imageName:String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName:String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    
    var imageName:String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,  height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom, 20)
    }
}

