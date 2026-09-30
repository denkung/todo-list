//
//  ContentView.swift
//  todo-list
//
//  Created by Teerapat Boonlert on 30/9/2569 BE.
//

import SwiftUI

struct ContentView: View {
    @State private var todoList: [Todo] = [
        Todo(title: "Meeting with Tom", isDone: false),
        Todo(title: "Math examination", isDone: false)
    ]
    var body: some View {
        VStack {
            Text("My Todo List")
                .font(.system(size: 30, weight: .semibold))
            
            ForEach(todoList) { todo in
                HStack {
                    Text(todo.title)
                        .font(.system(size: 20, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Image(systemName: todo.isDone ? "checkmark.circle.fill" : "checkmark.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                    })//Button: isDone
                }//HStack
                .padding()
                .background(.black.opacity(0.08))
                .clipShape(.rect(cornerRadius: 15))
            }//ForEach
        }//VStack
        .padding()
    }//compute property: body
}//struct: ContentView

#Preview {
    ContentView()
}//Preview
