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
    var event: Event
    var body: some View {
        Group{
            VStack {
                Text("Name: \(event.name) at \(event.startTime)")
                
                Text("\(event.amountPeople) people")
                
                Text("Description: \(event.description)")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 112)
            .background(Color("BackgroundWhite"))
            .cornerRadius(10)
        }
//        .navigationTitle("Add Event")
    }
}

//struct addEventButton: View {
//    var body: some View {
//        ZStack {
//            Image(systemName: "plus.circle.fill")
//                .frame(width: UIScreen.main.bounds.width - 350, height: UIScreen.main.bounds.height - 500, alignment: .bottomTrailing)
//        }
//    }
//}

struct ContentView: View {
    @State var events : [Event] = []
    @State var addEvent: Bool = false
//    var eventButton: some View {
//        ZStack {
//            VStack{
//                Image(systemName: "plus.circle.fill")
//                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .bottomTrailing)
//                    .imageScale(.large)
////                    .font(.system(size: 140))
//            }
//            .onTapGesture {
//                print("tapped")
//                self.addEvent = true
//            }
//        }
//    }
    
    var body: some View {
        NavigationView {
//            Color("DarkBack").edgesIgnoringSafeArea(.all)
            ZStack {
                if(addEvent){
                    AddEventView()
                }
                else{
                    VStack{
                        ScrollView(.vertical){
                            ForEach(self.events, id: \.name){
                                event in
                                VStack{
                                    HStack{
                                        EventView(event: event)
                                            .cornerRadius(13)
                                    }
                                }
                            }
                        }
                    }
                    //                EmptyView()
                    //fetch events and create vstack consisted of a for each
                }
            }
            //            .overlay(alignment: .bottomLeading, content: addEventButton)
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
            .overlay(NavigationLink(
                destination: AddEventView(),
                label: {
                    Image(systemName: "plus.circle.fill")
                        .frame(width: UIScreen.main.bounds.width - 200, height: UIScreen.main.bounds.height, alignment: .bottomTrailing)
                        .font(.system(size: 60))
                }
            ), alignment: .bottomLeading)
        }
        .onAppear(){
            NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Add Event"), object: nil, queue: .main) { [self] (Notification) in
                print("tryin to dismiss")
                var ev = Notification.object as! Event
                self.events.append(ev)
            }
            //add notification observer here for receiving an event
            //fetch events from Firebase here and update
        }
        //let NavBounds = self.view.bounds
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
