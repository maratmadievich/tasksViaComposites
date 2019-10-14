//
//  TaskProtocol.swift
//  Tasks
//
//  Created by Марат Нургалиев on 14/10/2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import Foundation

protocol TaskProtocol {
	
	var rootTask: TaskProtocol? { get }
	var taskName: String { get }
	var childTasks: [TaskProtocol] { get }
	
	func addSubtask(_ subtask: TaskProtocol)
}
