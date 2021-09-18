//
//  ViewModel.swift
//  ViewModel
//
//  Created by vojta on 18.09.2021.
//

import Combine
import Foundation


class ViewModel: ObservableObject {
    @Published var text = " import Foundation \n\n print ( \"hello world\" ) "
    @Published var output: String? = nil
    @Published var presented = false
    
    
    func runCompileing() {
        Task{
            do{
                try await compile()
                DispatchQueue.main.async {
                    self.presented.toggle()
                }
            }catch{
                print(error)
            }
        }
    }
    
    func compile() async throws {
        
        var urlRequest = URLRequest(url: URL(string: "https://swiftfiddle.com/runner/5.4.3/run")!)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = try JSONEncoder().encode(Request(code: text.replaceBadQuotes()))
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
        print("running...")
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        let decoded = try JSONDecoder().decode(Response.self, from: data)
        
        print(decoded, "succesfull request")
        if decoded.output != "" {
            DispatchQueue.main.async {
                self.output = decoded.output
            }
        }
    }
}
