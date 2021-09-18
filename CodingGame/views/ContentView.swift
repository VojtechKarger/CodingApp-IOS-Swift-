//
//  ContentView.swift
//  CodingGame
//
//  Created by vojta on 16.09.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @State var presented = false
    var body: some View {
        ZStack{
            Color.white
            VStack{
                HStack{
                    Spacer()
                    Button {
                        UIApplication.shared.endEditing()
                        viewModel.runCompileing()
                        presented.toggle()
                    } label: {
                        Text("Run")
                    }.padding([.top,.trailing])
                }
                ScrollView{
                    MultilineTextField("ahoj", text: $viewModel.text) {
                        print("commit")
                    }
                }
            }
            .sheet(isPresented: $presented, onDismiss: {
                viewModel.output = nil
            }, content: { Text(viewModel.output ?? "noOutput") })
            
        }
    }
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
