//
//  ViewController.swift
//  Tasks
//
//  Created by Марат Нургалиев on 14/10/2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	private let createTaskAlertTitle = "Создание задачи"
	private let createTaskAlertMessage = "Введите название для подзадачи"
	private let createTaskAlertSuccess = "Создать"
	private let createTaskAlertCancel = "Отмена"
	
	private let taskCellPresenterFactory = TaskCellPresenterFactory()
	
	internal var currentTask: TaskProtocol = TaskRoot()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureViews()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		tableView.reloadData()
	}
	
	private func configureViews() {
		let name = currentTask.taskName
		self.navigationItem.title = name
		
		tableView.delegate = self
		tableView.dataSource = self
		tableView.tableFooterView = UIView()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let destination = segue.destination as? TaskViewController,
		let selectedTask = sender as? TaskProtocol else { return }
		destination.currentTask = selectedTask
	}
	
	
	
}

//MARK: - Actions
extension TaskViewController {
	
	@IBAction func buttonAddTapped(_ sender: Any) {
		showCreateTaskAlert()
	}
	
}

//MARK: - private functions
extension TaskViewController {
	
	func createTask(name: String) {
		let task = Task(taskName: name, rootTask: currentTask)
		currentTask.addSubtask(task)
		tableView.reloadData()
	}
}

//MARK: - UITableView Extension
extension TaskViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return currentTask.childTasks.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let presenter = taskCellPresenterFactory.makeCellPresenter(for: tableView, for: indexPath)
		
		let task = currentTask.childTasks[indexPath.row]
		presenter.set(task: task)
		return presenter.getCell()
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let sender = currentTask.childTasks[indexPath.row]
		performSegue(withIdentifier: "showSubtasks", sender: sender)
	}
	
}

extension TaskViewController {
	
	private func showCreateTaskAlert() {
		let alert = UIAlertController(title: createTaskAlertTitle, message: createTaskAlertMessage, preferredStyle: .alert)
		alert.addTextField { (textField) in
			textField.placeholder = "Название задачи"
		}
		
		let actionSuccess = UIAlertAction(title: createTaskAlertSuccess, style: .default, handler: { [weak self] (_) in
			guard let textField = alert.textFields?[0],
				let taskName = textField.text else { return }
			self?.createTask(name: taskName)
		})
		
		let actionCancel = UIAlertAction(title: createTaskAlertCancel, style: .cancel, handler: nil)
		
		alert.addAction(actionSuccess)
		alert.addAction(actionCancel)
		self.present(alert, animated: true, completion: nil)
	}
	
}

