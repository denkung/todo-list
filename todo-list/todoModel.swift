//
//  todoModel.swift
//  todo-list
//
//  Created by Teerapat Boonlert on 30/9/2569 BE.
//

import Foundation
import Observation

@Observable
class Todo: Identifiable {
    var id: UUID = UUID()
    var title: String
    var isDone: Bool
    
    init(title: String, isDone: Bool) {
        self.title = title
        self.isDone = isDone
    }//initialization
}//class: Todo
