//
//  MySwiftUIApp.swift
//  MySwiftUI
//
//  Created by Mario Heberthardt on 20/10/2022.
//

import SwiftUI

@main
struct MySwiftUIApp: App {
    @StateObject var vm = MoviesVM()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
                .task(priority: .high) {
                    await vm.getMovies()
                }
        }
    }
}
