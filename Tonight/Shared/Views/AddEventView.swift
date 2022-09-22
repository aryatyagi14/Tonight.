//
//  AddEventButton.swift
//  Tonight
//
//  Created by Rohan Tyagi on 9/21/22.
//

import Foundation
import SwiftUI

struct AddEventView: View {
    @State var name: String = ""
    @State var description: String = ""
    @State var startTime: Date = Date()
    @State var expectedDuration: Int = 0
    @State var amountOfPeople: Int = 0
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var alertTitle = ""
//    @State var show = false
//    @State private var textStyle = UIFont.TextStyle.body

    
//    @ObservedObject var contactUs = ContactUsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                VStack (alignment: .leading) {
                    Text("Let's create your event")
                        .font(.custom("Futura Bold", size: 22))
//                        .foregroundColor(Color("OrangeWhite"))
                    Spacer()
                        .frame(height: CGFloat(30))
//                        .foregroundColor(Color("OrangeWhite"))
                }
                VStack (alignment: .leading) {
                    Text("What shall we call your event?")
                        .padding(.leading, (UIScreen.main.bounds.width * 10) / 414)
                        .padding(.trailing, (UIScreen.main.bounds.width * 10) / 414)
//                        .foregroundColor(Color("OrangeWhite"))
                    TextField("Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading, (UIScreen.main.bounds.width * 10) / 414)
                        .padding(.trailing, (UIScreen.main.bounds.width * 10) / 414)
                    Spacer()
                        .frame(height: CGFloat(30))
                }
                VStack (alignment: .leading) {
                    Text("What is your event about?")
                        .padding(.leading, (UIScreen.main.bounds.width * 10) / 414)
                        .padding(.trailing, (UIScreen.main.bounds.width * 10) / 414)
//                        .foregroundColor(Color("OrangeWhite"))
                        
                    TextField("Description", text: $description)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading, (UIScreen.main.bounds.width * 10) / 414)
                        .padding(.trailing, (UIScreen.main.bounds.width * 10) / 414)
                    Spacer()
                        .frame(height: CGFloat(30))
                }
                VStack{
                    Picker("Number of people", selection: $amountOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                }
                VStack{
                    DatePicker("Enter the time of event", selection: $startTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(GraphicalDatePickerStyle())
                }
                
//                VStack (alignment: .leading, spacing: 15) {
////                    Text("What's on your mind?")
////                        .padding(.leading, (UIScreen.main.bounds.width * 10) / 414)
////                        .padding(.trailing, (UIScreen.main.bounds.width * 10) / 414)
//                    TextView(text: self.$messageBody, textStyle: self.$textStyle)
//                        .padding(.horizontal)
//                }
                Spacer()
                    .frame(height: CGFloat(15))
                Button(action: {
                    let dispatch = DispatchGroup()
                    //add notification poster here for posting an event
//                    self.contactUs.sendResponse(email: self.email, messageBody: self.messageBody, name: self.name, disp: dispatch)
//                    self.alertMessage = self.contactUs.alertMessage
//                    self.alertTitle = self.contactUs.alertTitle
//                    self.showingAlert.toggle()
                    let event = Event(name: self.name, description: self.description, startTime: self.startTime, amountPeople: self.amountOfPeople)
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Add Event"), object: event)
                }) {
                    Text("Add Event")
//                        .foregroundColor(Color("OrangeWhite"))
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Thank you for submitting"), message: Text("\(self.alertMessage)"), dismissButton: .default(Text("OK")))
                }
                Spacer()
                
            }
            .navigationBarTitle("Add Event")
            .navigationBarHidden(true)
//            .blur(radius: self.show ? 15 : 0)

        }
        
    }
}
