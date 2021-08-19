//
//  ContentView.swift
//  SwiftUI-WeatherApp
//
//  Created by Kevin Tan on 16/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var isNight : Bool = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack {
                LocationWeatherView(locationName: "Cupertino, CA", weatherSymbol: !isNight ? "cloud.sun.fill" : "moon.stars.fill", width: 180, height: 180, size: 72, temperature: 76)
                
                Spacer()
                
                HStack(spacing: 12.5) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", degree: 74)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", degree: 70)
                    WeatherDayView(dayOfWeek: "THUR", imageName: "wind", degree: 66)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", degree: 60)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "moon.stars.fill", degree: 55)
                }
                
                Spacer()
                
                Button {
//                    isNight = !isNight
                    isNight.toggle()
                    print("tapped")
                } label: {
                    Text("Changed Day Time")
                        .frame(width: 280, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.white)
                        .font(.system(size: 18, weight: .bold, design: .default))
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
    
    var dayOfWeek: String
    var imageName: String
    var degree: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek.uppercased())
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40,alignment: .center)
            Text("\(degree)°")
                .font(.system(size: 24, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight : Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [
            !isNight ? .blue : .black,
            !isNight ? Color("LightBlue") : .white
        ]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct LocationWeatherView: View {
    
    var locationName: String
    var weatherSymbol : String
    var width, height, size : CGFloat
    var temperature : Int
    
    var body: some View {
        VStack(spacing: 8) {
            Text(locationName)
                .font(.system(size: 32, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
            Image(systemName: weatherSymbol)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
            Text("\(temperature)°")
                .font(.system(size: size, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
