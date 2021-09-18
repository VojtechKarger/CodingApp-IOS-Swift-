//
//  ContentView.swift
//  CodingGame
//
//  Created by vojta on 16.09.2021.
//

import SwiftUI

struct ContentView: View {
    @State var text = String()
    
    var body: some View {
        ZStack{
            Color.green
            TextView().frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
