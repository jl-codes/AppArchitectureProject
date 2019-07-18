//
//  EmployeeViewModel.swift
//  AppArchitectureProject
//
//  Created by MCS on 7/18/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

final class EmployeeViewModel {
 
  private var employees: [Employee] = []
  private var shouldGetEmployees = true
  
  init(employees: [Employee] = [], shouldGetEmployees: Bool = true) {
    self.employees = employees
    self.shouldGetEmployees = shouldGetEmployees
  }
  
  func getEmployees() {
    guard shouldGetEmployees else { return }
    employees = [Employee(name: "Bob", subordinates: getRegionalManagers())]
    shouldGetEmployees = false
  }
  
  private func getRegionalManagers() -> [Employee] {
    let regMan1 = Employee(name: "John", subordinates: getJohnSubordinates())
    let regMan2 = Employee(name: "Brian", subordinates: getBrianSubordinates())
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
  
  func getNumberOfEmployees() -> Int {
    return employees.count
  }
  
  func getEmployeeName(at index: Int) -> String? {
    guard index >= 0 && index < employees.count else { return nil }
    return employees[index].name
  }
  
  func shouldContinue(at index: Int) -> Bool {
    guard index >= 0 && index < employees.count else { return false }
    return !employees[index].subordinates.isEmpty
  }
  
  func getViewModel(for index: Int) -> EmployeeViewModel? {
    guard shouldContinue(at: index) else { return nil }
    return EmployeeViewModel(employees: employees[index].subordinates, shouldGetEmployees: false)
  }
}
