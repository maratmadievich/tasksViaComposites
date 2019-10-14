//
//  TaskRoot.swift
//  Tasks
//
//  Created by Марат Нургалиев on 14/10/2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import Foundation

class TaskRoot: TaskProtocol {
	
	private var root: TaskProtocol? = nil
	private var name: String = "Root"
	private var childs: [TaskProtocol] = []
	
	var rootTask: TaskProtocol? {
		return nil
	}
	
	var taskName: String {
		return self.name
	}
	
	var childTasks: [TaskProtocol] {
		return childs
	}
	
	required init() {}
	
	func addSubtask(_ subtask: TaskProtocol) {
		childs.append(subtask)
	}
	
	
}
