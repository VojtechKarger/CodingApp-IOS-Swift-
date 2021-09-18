//
//  ContentView.swift
//  CodingGame
//
//  Created by vojta on 16.09.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()

    var body: some View {
        ZStack{
            Color.antiprimary.ignoresSafeArea()
            VStack{
                HStack{
                    Text("Code!")
                        .font(.title)
                        .padding([.top,.leading])
                    Spacer()
                    Button(action: run, label: { Text("run") })
                        .padding(.trailing)
                        .padding(.top,7)
                }
                DisclosureGroup("view output") {
                    Text(viewModel.output ?? "run your code to see the output")
                        .frame(maxWidth: .infinity, minHeight: 100)
                }
                .padding()
                ScrollView{
                    MultilineTextField("ahoj", text: $viewModel.text) {
                        print("commit")
                    }
                    .accentColor(.primary.opacity(0.7))
                }
            }
            .accentColor(.primary)
        }
    }
    func run() {
        UIApplication.shared.endEditing()
        viewModel.runCompileing()
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
