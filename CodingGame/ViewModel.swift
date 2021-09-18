//
//  ViewModel.swift
//  ViewModel
//
//  Created by vojta on 18.09.2021.
//

import Combine


class ViewModel: ObservableObject {
    @Published var text = " import Foundation \n\n"
    @Published var output: String? = nil
}
