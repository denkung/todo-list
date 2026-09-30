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
    @State private var showFormCreate: Bool = false
    @State private var todoTitle: String = ""
    
    var body: some View {
        VStack {
            Text("My Todo List")
                .font(.system(size: 30, weight: .semibold))
            
            ForEach(todoList) { todo in
                HStack {
                    Text(todo.title)
                        .font(.system(size: 20, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        todo.isDone.toggle()
                    }, label: {
                        Image(systemName: todo.isDone ? "checkmark.circle.fill" : "checkmark.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                    })//Button: isDone
                }//HStack
                .padding()
                .background(.black.opacity(0.08))
                .clipShape(.rect(cornerRadius: 15))
            }//ForEach
            
            Spacer()
                .frame(height: 50)
            
            Button(action: {
                showFormCreate = true
            }, label: {
                Text("New Todo")
                    .padding()
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .background(.purple)
                    .clipShape(.rect(cornerRadius: 15))
            })//Button: New Todo
        }//VStack
            .padding()
            .sheet(isPresented: $showFormCreate, content: {
                VStack {
                    TextField("Title", text: $todoTitle)
                        .textFieldStyle(.roundedBorder)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    Button(action: {
                        todoList.append(Todo(title: todoTitle, isDone: false))
                        showFormCreate = false
                        todoTitle = ""
                    }, label: {
                        Text("Create Todo")
                            .padding()
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .background(.orange)
                            .clipShape(.rect(cornerRadius: 15))
                    })//Button: Create Todo
                }//VStack
                .padding()
            })//sheet: show form create
    }//compute property: body
}//struct: ContentView

#Preview {
    ContentView()
}//Preview
