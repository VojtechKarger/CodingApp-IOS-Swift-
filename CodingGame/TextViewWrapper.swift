//
//  TextViewWrapper.swift
//  TextViewWrapper
//
//  Created by vojta on 17.09.2021.
//

import SwiftUI
import UIKit



struct TextView: UIViewControllerRepresentable {
 
    func makeUIViewController(context: Context) -> some UIViewController {
        return ColoringTextView()
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}




