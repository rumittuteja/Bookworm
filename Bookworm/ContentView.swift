//
//  ContentView.swift
//  Bookworm
//
//  Created by Rumit Singh Tuteja on 5/13/24.
//


import SwiftData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    
    // automatically find the main context, and queries the container through the main context, will also watch updates over time, if the array changes, the view will be updated. Now the students array is a regular array.
    // simple sort when we are sorting on one parameter
    @Query(sort: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    ]) var books: [Book]
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack {
            
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {                        
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                            .padding()
                        }
                    }
                }
                .onDelete(perform:delete)
            }
            .navigationTitle("Bookworm")
            .navigationDestination(for: Book.self, destination: { book in
                DetailView(book: book)
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Book", systemImage: "plus") {
                        showingAddScreen.toggle()
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
        }
               
    }
    
    func delete(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            modelContext.delete(book)
        }
    }
}



/*
 
 
 
 
 
 NavigationStack {
     List(students) { student in
         Text(student.name)
     }
     .navigationTitle("Classroom")
     .toolbar {
         Button("Add") {
             let firstNames = ["Ginny", "Harry", "Hermoine", "Luna", "Ron"]
             let lastNames = ["Granger", "Lovegood", "Potter", "Wesley"]
             
             let chosenFirstName = firstNames.randomElement()!
             let chosenLastName = lastNames.randomElement()!
             
             let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
             modelContext.insert(student)
             // student will be queued up for saving as soon as possible
         }
     }
 }
 
 //////////////////
 
 struct PushButton : View {
     
     
     
     let title: String
     @Binding var isOn: Bool
     
     var onColors = [Color.red, Color.yellow]
     var offColors = [Color(white: 0.6), Color(white: 0.4)]
     
     var body: some View {
         Button(title) {
             isOn.toggle()
         }
         .padding()
         .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
         .foregroundStyle(.white)
         .clipShape(.capsule)
         .shadow(radius:  isOn ? 0 : 5)
     }
 }
 
 // State variable is bound to the value passed to the custom button, therefore the state is maintained in both views coherently when the button is clicked.
 @State private var rememberMe = false
 
 
 
 VStack {
     PushButton(title: "Remember Me", isOn: $rememberMe)
     Text(rememberMe ? "On" : "Off")
 }
 .padding()

 */

#Preview {
    ContentView()
}
