//
//  EmployeeController.swift
//  AppArchitectureProject
//
//  Created by MCS on 7/18/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

final class EmployeeController {
  func getEmployees() -> [Employee] {
    let ceo = Employee(name: "Bob", subordinates: [])
    let regMan1 = Employee(name: "John", subordinates: getJohnSubordinates())
    let regMan2 = Employee(name: "Brian", subordinates: getBrianSubordinates())
    return [ceo]
  }
  
  private func getRegionalManagers() -> [Employee] {
    let regMan1 = Employee(name: "John", subordinates: [])
    let regMan2 = Employee(name: "Brian", subordinates: [])
    return [regMan1, regMan2]
  }
  
  private func getJohnSubordinates() -> [Employee] {
    let sub1 = Employee(name: "Chris", subordinates: [])
    let sub2 = Employee(name: "Ash", subordinates: [])
    return [sub1, sub2]
  }
  
  private func getBrianSubordinates() -> [Employee] {
    let sub1 = Employee(name: "Paul", subordinates: [])
    let sub2 = Employee(name: "Ryan", subordinates: [])
    return [sub1, sub2]
  }
}
