//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Tony Sharples on 08/04/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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
