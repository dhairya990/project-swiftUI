//
//  ContentView.swift
//  project swiftUI
//
//  Created by Dhairya bhardwaj on 03/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private  var isNight = false
    
    var body: some View {
        ZStack{
            backgroundView(topColor: isNight ? .black : .blue, bottomColor: isNight ? .blue : .black)
            
            VStack {
                
                cityTextView(cityName: "New Delhi,India")
                    
                
                
                VStack{
                    MainWeatherStatusView(imageName: isNight ? "moon.fill" : "cloud.sun.fill", temperature: 50)
                }
                
                
                Spacer()
                
                
                HStack(spacing: 30){
                    WeatherDayview(dayOfWeek: "Tue", imageName: isNight ?  "aqi.low" : "cloud.bolt.rain", temperature: 35)
                        .foregroundColor(Color.white)
                    WeatherDayview(dayOfWeek: "Wed", imageName: "cloud.bolt", temperature: 11)
                        .foregroundColor(Color.white)
                    WeatherDayview(dayOfWeek: "THu", imageName:isNight ? "cloud.rain": "sun.max.fill" , temperature: 39)
                        .foregroundColor(Color.white)
                    WeatherDayview(dayOfWeek: "Fri", imageName: isNight ? "cloud.moon": "sun.max.fill", temperature: 40)
                        .foregroundColor(Color.white)
                    WeatherDayview(dayOfWeek: "Sat", imageName: "cloud.hail", temperature: 22)
                        .foregroundColor(Color.white)
                }
                
                Spacer()
                Spacer()
                Button(action: {
                    isNight.toggle()
                    
                }, label: {
                    WeatherButton(title: "Change day time",textColor: .black, backgroundColor: .white)
                        
                    
                })
                .padding(.bottom,40)
                .foregroundColor(Color.black)
            }
            
        }
    }
}
#Preview {
    ContentView()
}

struct WeatherDayview: View {
    var dayOfWeek:String
    var imageName:String
    var temperature:Int
 
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16,weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28,weight: .medium))
                .foregroundColor(.white  )
        }
    }
}

struct backgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [topColor,bottomColor]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: .bottomTrailing).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct cityTextView :View {
    var cityName :String
    var body: some View {
        Text(cityName)
            .font(.system(size: 25,weight: .medium,design: .default))
            .background(.white)
            .frame(width:200, height: 100)
            .padding()
    }
}


struct MainWeatherStatusView:View {
    var imageName:String
    var temperature:Int
    
    var body: some View {
        Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:180,height:180,alignment: .center)
            Text("\(temperature)°")
                .font(.system(size: 60,weight: .medium))
                .foregroundColor(.white  )
    }
}

