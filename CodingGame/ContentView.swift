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
                        Task{
                            do{
                                try await compile()
                            }catch{
                                print(error)
                            }
                        }
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
    
    
    func compile() async throws {
        
        var urlRequest = URLRequest(url: URL(string: "https://swiftfiddle.com/runner/5.4.3/run")!)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = try JSONEncoder().encode(Request(code: viewModel.text.replaceBadQuotes()))
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
        print("running...")
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        let decoded = try JSONDecoder().decode(Response.self, from: data)
        
        print(decoded, "succesfull request")
        if decoded.output != "" {
            presented = true
            DispatchQueue.main.async {
                viewModel.output = decoded.output
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
