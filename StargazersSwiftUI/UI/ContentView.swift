//
//  ContentView.swift
//  StargazersSwiftUI
//
//  Created by Gualtiero Frigerio on 16/09/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import Combine
import SwiftUI

struct ContentView: View {
    @State var buttonDisabled = false
    @State var showAlert = false
    @State var showSheet = false
    @State var alertMessage = ""
    @State var stargazers:[User] = []
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Select owner")) {
                    TextField("Owner", text: $viewModel.owner)
                }
                Section(header: Text("Select repository")) {
                    TextField("Repository", text: $viewModel.repository)
                }
            }
            Button(action: {
                self.viewModel.getStargazers { users in
                    print("stargazers returned")
                    self.stargazers = users ?? []
                    self.showSheet.toggle()
                }
            }) {
                Text("Show stargazers")
            }.disabled(buttonDisabled)
        }.onReceive(self.viewModel.enableSearch) { enable in
            self.buttonDisabled = !enable
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Alert"), message: Text(alertMessage), dismissButton: .default(Text("Ok")))
        }
        .sheet(isPresented:$showSheet) {
            StargazersView(stargazers:self.stargazers)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
