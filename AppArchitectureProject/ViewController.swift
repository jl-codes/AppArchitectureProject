//
//  ViewController.swift
//  AppArchitectureProject
//
//  Created by MCS on 7/18/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var employeeTableView: UITableView!
//  var employees: [Employee] = []
//  let employeeController = EmployeeController()
//  var shouldGetEmployeeList = true
  var viewModel = EmployeeViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    employeeTableView.dataSource = self
    employeeTableView.delegate = self
    employeeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//    guard shouldGetEmployeeList else { return }
//    employees = employeeController.getEmployees()
    viewModel.getEmployees()
    employeeTableView.reloadData()
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //return 0 //employees.count
    return viewModel.getNumberOfEmployees()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    cell.textLabel?.text = viewModel.getEmployeeName(at: indexPath.row)
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    let tappedEmployee = employees[indexPath.row]
//    guard !tappedEmployee.subordinates.isEmpty else { return }
    guard let nextViewModel = viewModel.getViewModel(for: indexPath.row) else { return }
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let nextViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//    nextViewController.employees = tappedEmployee.subordinates
//    nextViewController.shouldGetEmployeeList = false
    nextViewController.viewModel = nextViewModel
    
      navigationController?.pushViewController(nextViewController, animated: true)
  }
}
