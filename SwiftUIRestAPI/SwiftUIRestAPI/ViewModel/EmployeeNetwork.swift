//
//  EmployeeNetwork.swift
//  SwiftUIRestAPI
//
//  Created by Angelos Staboulis on 6/9/21.
//

import Foundation
import Alamofire
import SwiftyJSON
class EmployeeNetwork{
    static let shared = EmployeeNetwork()
    var employees:[Employee]=[]
    private init(){}
    func fillEmployeeRecord(json:JSON,item:Int)->Employee{
        return  Employee(id: item+1, idRecord: json["data"][item]["id"].intValue, employee_name: json["data"][item]["employee_name"].stringValue, employee_salary: json["data"][item]["employee_salary"].intValue, employee_age: json["data"][item]["employee_age"].intValue, profile_image: json["data"][item]["profile_image"].stringValue)
    }
    func fetchEmployees(completion:@escaping (([Employee])->())){
        let url = URL(string: "http://dummy.restapiexample.com/api/v1/employees")
        let request = URLRequest(url: url!)
        AF.request(request).responseJSON { (dataResponse) in
            let json = JSON(dataResponse.value)
            for item in 0..<json["data"].count{
                self.employees.append(self.fillEmployeeRecord(json: json, item: item))
            }
            completion(self.employees)
        }
    }
}
