//
//  ContentView.swift
//  Weather
//
//  Created by Marc on 13/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var geocodingViewModel: OpenWeatherGeocodingViewModel = OpenWeatherGeocodingViewModel()
    @StateObject private var forecastViewModel: OpenWeatherForecastViewModel = OpenWeatherForecastViewModel()
    
    @State private var searchTextFieldText = ""
    @State private var showCityNamesDropdown = false
    @State private var showForecastView = false
    
    /*
     
     The following two variables would not be necessary if the API was designed to work with pagination, since this is not the case I have programmed a simulation of data being added to the list a little further down.
     
     */
    private var filteredForecastList: ArraySlice<OpenWeatherForecastModelList> {
        
        return (forecastViewModel.data?.list ?? []).prefix(filteredForecastListSize)
    }
    @State private var filteredForecastListSize: Int = 10
    
    @State private var sheetDetailView: Bool = false
    @State private var selectedForecastListIndex: Int = 0
    
    var body: some View {
        
        VStack {
            
            SearchTextField(searchTextFieldText: $searchTextFieldText, onSubmit: {
                
                if !searchTextFieldText.isEmpty {
                    
                    showForecastView = false
                    
                    Task {
                        
                        await geocodingViewModel.getData(cityName: searchTextFieldText)
                    }
                }
            })
            .onChange(of: geocodingViewModel.state, {
                
                if geocodingViewModel.state == .data {
                    
                    withAnimation {
                        
                        showCityNamesDropdown = true
                    }
                }
            })
            .onChange(of: forecastViewModel.state, {
                
                if geocodingViewModel.state == .data || geocodingViewModel.state == .loadingNextPage {
                    
                    withAnimation {
                        
                        showForecastView = true
                    }
                } else {
                    
                    withAnimation {
                        
                        showForecastView = false
                    }
                }
            })
            
            ZStack {
                
                if showForecastView, !filteredForecastList.isEmpty {
                    
                    List {
                        
                        ForecastDetailView(forecastViewModel: forecastViewModel, index: 0)
                        
                        ForEach(filteredForecastList.indices, id: \.self) {
                            
                            index in
                            
                            Button(
                                action: {
                                
                                    selectedForecastListIndex = index
                                    sheetDetailView = true
                                },
                                label: {
                                
                                    ForecastListItemView(forecastListItem: filteredForecastList[index])
                                }
                            )
                        }
                        
                        switch forecastViewModel.state {
                            
                        case .loadingNextPage:
                            
                            ProgressView()
                                .id(UUID())
                        case .data:
                            
                            if filteredForecastListSize < forecastViewModel.data?.list.count ?? 0 {
                                
                                ProgressView()
                                    .id(UUID())
                                    .onAppear {
                                        
                                        /*
                                         
                                         If the API was designed to work with pagination here I would do something like await forecastViewModel.getData(...) to get the data for the next page, but since this is not the case the following code simulates the behavior of data being added to the list.
                                         
                                         }*/
                                        
                                        Task {
                                            
                                            forecastViewModel.state = .loadingNextPage
                                            
                                            try await Task.sleep(for: .seconds(3))
                                            
                                            if filteredForecastListSize + 10 < forecastViewModel.data?.list.count ?? 0 {
                                                
                                                filteredForecastListSize += 10
                                            } else {
                                                
                                                filteredForecastListSize = forecastViewModel.data?.list.count ?? 0
                                            }
                                            
                                            forecastViewModel.state = .data
                                        }
                                    }
                            }
                        default:
                            
                            EmptyView()
                        }
                    }
                }
                
                if showCityNamesDropdown, let geocodingList = geocodingViewModel.data {
                    
                    VStack {
                        
                        VStack {
                            
                            ForEach(geocodingList, id: \.name) {
                                
                                geocodingItem in
                                
                                Button(
                                    action: {
                                        
                                        showCityNamesDropdown = false
                                        forecastViewModel.data = nil
                                        
                                        Task {
                                            
                                            await forecastViewModel.getData(latitude: geocodingItem.lat, longitude: geocodingItem.lon)
                                        }
                                    },
                                    label: {
                                        
                                        HStack {
                                            
                                            Text("\(geocodingItem.name), \(geocodingItem.state), \(geocodingItem.country)")
                                                .padding()
                                        }
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                    }
                                )
                            }
                        }
                        .background(Color("BackgroundContrastColor"))
                        
                        Spacer()
                    }
                } else if geocodingViewModel.state == .loadingNextPage {
                    
                    ProgressView()
                        .id(UUID())
                }
            }
            
            Spacer()
        }
        .background(Color("BackgroundColor"))
        .sheet(isPresented: $sheetDetailView, content: {
            
            ForecastDetailView(forecastViewModel: forecastViewModel, index: selectedForecastListIndex)
            .presentationBackground(Color("BackgroundColor"))
        })
    }
}

#Preview {
    
    ContentView()
}
