//
//  ContentView.swift
//  SmartEVNavigator
//
// 
//

import SwiftUI
import CoreLocation
import MapKit

struct ContentView: View {
    @State private var destination: String = ""
    @State private var predictedRange: Double = 0
    @State private var anxietyScore: Int = 0
    @State private var routeSuggestions: [String] = []
    @StateObject private var locationManager = LocationManager()

    var userLocation: CLLocationCoordinate2D {
        locationManager.lastLocation ?? CLLocationCoordinate2D(latitude: 0, longitude: 0)
    }

    var mapRegion: Binding<MKCoordinateRegion> {
        Binding(
            get: {
                MKCoordinateRegion(
                    center: userLocation,
                    span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                )
            },
            set: { _ in }
        )
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Map(coordinateRegion: mapRegion)
                    .frame(height: 250)
                    .cornerRadius(12)

                TextField("Enter your destination", text: $destination)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Button("Plan Smart Route") {
                    fetchVehicleDataAndPredict()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)

                if predictedRange > 0 {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Predicted Range: \(Int(predictedRange)) km")
                        Text("Mileage Anxiety Score: \(anxietyScore)/100")
                            .foregroundColor(anxietyScore >= 50 ? .red : .green)
                        if !routeSuggestions.isEmpty {
                            Text("Suggested Adjustments:").bold()
                            ForEach(routeSuggestions, id: \.self) { suggestion in
                                Text("• \(suggestion)")
                            }
                        }
                    }
                    .padding()
                }

                Spacer()
            }
            .navigationTitle("SmartEV Navigator")
        }
    }

    func fetchVehicleDataAndPredict() {
        guard let url = URL(string: "https://your-api.com/fetch-ev-data") else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }

            do {
                let apiResponse = try JSONDecoder().decode(VehicleData.self, from: data)

                calculateDistanceToDestination { distance in
                    predictedRange = RangePredictor.predictRange(input: apiResponse)
                    anxietyScore = AnxietyCalculator.calculateAnxietyScore(predictedRange: predictedRange, targetDistance: distance)
                    routeSuggestions = anxietyScore > 50 ?
                        ["Reduce speed to conserve battery", "Enable eco-mode driving", "Consider stopping at a charging station"] :
                        ["You are good to go!"]
                }

            } catch {
                print("Decoding error: \(error)")
            }
        }

        task.resume()
    }

    func calculateDistanceToDestination(completion: @escaping (Double) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(destination) { placemarks, error in
            if let location = placemarks?.first?.location {
                let userLoc = CLLocation(latitude: userLocation.latitude, longitude: userLocation.longitude)
                let distance = userLoc.distance(from: location) / 1000
                completion(distance)
            } else {
                print("Geocoding error: \(error?.localizedDescription ?? "Unknown")")
            }
        }
    }
}

#Preview {
    ContentView()
}


