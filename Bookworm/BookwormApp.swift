//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Rumit Singh Tuteja on 5/13/24.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self) // creates the actual physical storage on the device, and creates the model context automatically for us. The statement tells SwiftUI to make the data container available everywhere throughout our project.
    }
}
