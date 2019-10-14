//
//  TaskCellPresenter.swift
//  Tasks
//
//  Created by Марат Нургалиев on 14/10/2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

protocol TaskCellPresenterProtocol {
	init(cell: UITableViewCell)
	
	func set(task: TaskProtocol)
	func getCell() -> UITableViewCell
}

class TaskCellPresenter: TaskCellPresenterProtocol {
	
	private var cell: UITableViewCell
	
	required init(cell: UITableViewCell) {
		self.cell = cell
	}
	
	func set(task: TaskProtocol) {
		guard let taskCell = cell as? TaskCell else {
			return
		}
		taskCell.labelName.text = task.taskName
		
		let countTasks = task.childTasks.count
		taskCell.labelCount.text = "Подзадач: \(countTasks)"
	}
	
	func getCell() -> UITableViewCell {
		return cell
	}
	
}
