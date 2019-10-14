//
//  Task.swift
//  Tasks
//
//  Created by Марат Нургалиев on 14/10/2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import Foundation

class Task: TaskProtocol {
	
	private var root: TaskProtocol?
	private var name: String!
	private var childs: [TaskProtocol] = []
	
	var rootTask: TaskProtocol? {
		return self.root
	}
	
	var taskName: String {
		return self.name
	}
	
	var childTasks: [TaskProtocol] {
		return childs
	}
	
	required init(taskName: String, rootTask: TaskProtocol?) {
		self.name = taskName
		self.root = rootTask
	}
	
	func addSubtask(_ subtask: TaskProtocol) {
		self.childs.append(subtask)
	}
}




