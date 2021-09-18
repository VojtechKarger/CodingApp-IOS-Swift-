//
//  StringMarkingExtension.swift
//  StringMarkingExtension
//
//  Created by vojta on 16.09.2021.
//

import UIKit
import SwiftUI

struct ColoringStruct {
    let string: String
    let color: UIColor
}

extension String {

    func colorTheText(atributes: [String: UIColor]) -> NSMutableAttributedString {
        let strings = self.components(separatedBy: " ")
        let string = NSMutableAttributedString(string: "")
        for str in strings {
            print(str)
            if let color = atributes[str] {
                let atributedString = NSAttributedString(string: str + " ", attributes: [NSAttributedString.Key.foregroundColor: color])
                string.append(atributedString)
            }else{
                string.append(NSAttributedString(string: str + " "))
            }
        }
        return string
    }
}



struct UIKLabel: UIViewRepresentable {

    typealias TheUIView = UILabel
    var configuration = { (view: TheUIView) in }

    func makeUIView(context: UIViewRepresentableContext<Self>) -> TheUIView { TheUIView() }
    func updateUIView(_ uiView: TheUIView, context: UIViewRepresentableContext<Self>) {
        configuration(uiView)
    }
}
