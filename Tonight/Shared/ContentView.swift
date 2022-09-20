//
//  ContentView.swift
//  Shared
//
//  Created by Arya Tyagi on 7/2/22.
//

import SwiftUI
import UIKit

public var NavBounds = (0,0)

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Here is where the profile stuff should go")
        }
        .navigationTitle("My Profile")
    }
}

struct ChatView: View {
    var body: some View {
        VStack {
            Text("This is where chats would go")
        }
        .navigationTitle("My Chats")
    }
}

struct EventView: View {
    var body: some View {
        VStack {
            Text("This is where we would add events")
        }
        .navigationTitle("Add Event")
    }
}

struct addEventButton: View {
    var body: some View {
        ZStack {
            Image(systemName: "plus.circle.fill")
                .frame(width: UIScreen.main.bounds.width - 350, height: UIScreen.main.bounds.height - 500, alignment: .bottomTrailing)
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                EmptyView()
            }
//            .overlay(alignment: .bottomLeading, content: addEventButton)
            .overlay(addEventButton(), alignment: .bottomLeading)
            .navigationTitle("Tonight")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: NavigationLink(
                    destination: ProfileView(),
                    label: {
                        Image(systemName: "person.fill")
                            //.foregroundColor(.white)
                    }
                ),
                trailing: NavigationLink(
                    destination: ChatView(),
                    label: {
                        Image(systemName: "message.fill")
                            //.foregroundColor(.white)
                    }
                )
            )
        }
        //let NavBounds = self.view.bounds
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
