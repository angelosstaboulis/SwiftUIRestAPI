//
//  ContentView.swift
//  SwiftUIRestAPI
//
//  Created by Angelos Staboulis on 5/9/21.
//

import SwiftUI
import Alamofire
import SwiftyJSON
struct ContentView: View {
    @ObservedObject var viewModel = EmployeeViewModel()
    var body: some View {
        Form{
            List(viewModel.employess){item in
                VStack{
                    Text(String(item.id)).frame(width: 230, height: 50, alignment: .leading)
                    Text(item.employee_name).frame(width: 230, height: 50, alignment: .leading)
                    Text(String(item.employee_age)).frame(width: 230, height: 50, alignment: .leading)
                    Text(String(item.employee_salary)).frame(width: 230, height: 50, alignment: .leading)
                }
             
            }.frame(width: 1200, height: 190, alignment: .topLeading)
        }.onAppear {
            viewModel.fetchEmployees()
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
