//
//  UIAplicationExtension.swift
//  UIAplicationExtension
//
//  Created by vojta on 18.09.2021.
//

import Foundation
import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
