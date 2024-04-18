//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Tony Sharples on 08/04/2024.
//

import SwiftUI

struct ContentView: View {
    let averageHighTemp = (20 + 12 + 10 + 20 + 12 + 10 + 20) / 7
    let averageLowTemp = (11 + 5 + 6 + 11 + 5 + 6 + 11) / 7
    
    var body: some View {
        VStack {
            Text("Weekly Forecast")
                .font(.title)
                .padding(.horizontal)
            
            ScrollView(.horizontal) {
                HStack {
                    DayForecast(day: "Mon", isRainy: false, high: 20, low: 11)
                    DayForecast(day: "Tue", isRainy: true, high: 12, low: 5)
                    DayForecast(day: "Wed", isRainy: true, high: 10, low: 6)
                    DayForecast(day: "Thu", isRainy: false, high: 20, low: 11)
                    DayForecast(day: "Fri", isRainy: true, high: 12, low: 5)
                    DayForecast(day: "Sat", isRainy: false, high: 10, low: 6)
                    DayForecast(day: "Sun", isRainy: false, high: 20, low: 11)
                }
            }
            
            Text("Weekly Stats")
                .font(.title)
                .padding()
            
            WeekForecast(averageHighTemp: averageHighTemp, averageLowTemp: averageLowTemp, numberOfSunnyDays: 4, numberOfRainyDays: 3)
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}

struct DayForecast: View {
    let day: String
    let isRainy: Bool
    let high: Int
    let low: Int
    
    var iconName: String {
        if isRainy {
            "cloud.rain.fill"
        } else {
            "sun.max.fill"
        }
    }
    
    var iconColour: Color {
        if isRainy {
            Color.blue
        } else {
            Color.yellow
        }
    }
    
    var body: some View {
        VStack {
            Text(day)
                .font(.headline)
            
            Image(systemName: iconName)
                .foregroundStyle(iconColour)
                .font(.largeTitle)
                .padding(2)
            
            Text("High: \(high)")
                .fontWeight(.bold)
            
            Text("Low: \(low)")
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

struct WeekForecast: View {
    let averageHighTemp: Int
    let averageLowTemp: Int
    let numberOfSunnyDays: Int
    let numberOfRainyDays: Int
    
    var body: some View {
        VStack {
            Text("Mon, 15 April 2024 - Sun, 21 April 2024")
                .padding(.bottom)
            
            Text("Average high temperature")
            Text("\(averageHighTemp)")
                .padding(.bottom)
            
            Text("Average low temperature")
            Text("\(averageLowTemp)")
                .padding(.bottom)
            
            Text("Number of days with rain")
            Text("\(numberOfRainyDays)")
                .padding(.bottom)
            
            Text("Number of days with sun")
            
            Text("\(numberOfSunnyDays)")
                .padding(.bottom)
        }
    }
}
