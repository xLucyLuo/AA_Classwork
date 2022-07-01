
import React from 'react'
import TodoListItem from './todoListItem'
import TodoForm from './todoForm'

class TodoList extends React.Component{
    componentDidMount(){
        this.props.fetchTodos()
    }

    render(){
        return (
            <div>
                <h1>Todo List</h1>
                <ul>
                    {this.props.todos.map(todo => (
                        <TodoListItem key={todo.id} todo={todo} removeTodo={this.props.removeTodo} receiveTodo={this.props.receiveTodo}/>
                    ))}
                </ul>
                <TodoForm receiveTodo={this.props.receiveTodo} createTodo={this.props.createTodo}/>
            </div>
        )
    }

}


export default TodoList