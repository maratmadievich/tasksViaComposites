//
//  TaskCellPresenterFactory.swift
//  Tasks
//
//  Created by Марат Нургалиев on 14/10/2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

protocol TaskCellPresenterFactoryProtocol {
	
	func makeCellPresenter(for tableView: UITableView, for indexPath: IndexPath) -> TaskCellPresenterProtocol
	
}

class TaskCellPresenterFactory: TaskCellPresenterFactoryProtocol {
	
	private let defaultCellIdentifier = "TaskCell"
	private let defaultCell = UITableViewCell()
	
	
	func makeCellPresenter(for tableView: UITableView, for indexPath: IndexPath) -> TaskCellPresenterProtocol {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: defaultCellIdentifier, for: indexPath) as? TaskCell else {
			let taskCellPresenter = TaskCellPresenter(cell: defaultCell)
			return taskCellPresenter }
		let taskCellPresenter = TaskCellPresenter(cell: cell)
		return taskCellPresenter
	}
}
