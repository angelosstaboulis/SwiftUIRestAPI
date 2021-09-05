//
//  EmployeeViewModel.swift
//  SwiftUIRestAPI
//
//  Created by Angelos Staboulis on 6/9/21.
//

import Foundation
import SwiftUI
class EmployeeViewModel:ObservableObject{
    @Published var employess:[Employee]=[]
    var network:EmployeeNetwork
    init(){
        network = EmployeeNetwork.shared
    }
    func fetchEmployees(){
        network.fetchEmployees { (array) in
            for item in 0..<array.count{
                self.employess.append(array[item])
            }
        }
    }
}
