import React from 'react'
import TodoDetailViewContainer from './todoDetailViewContainer'

class TodoListItem extends React.Component {

    constructor(props){
        super(props)
        this.state = {
            detail: false
        }
        this.detailClickHandler = this.detailClickHandler.bind(this)
    }

    render() {
        return(
        <li>
            <a onClick={this.detailClickHandler}>{this.props.todo.title}</a>
            {/* <button onClick={() => {return removeTodo(todo)}}>Delete</button> */}
            <button onClick={() => {return receiveTodo(this.toggleDone(this.props.todo))}}>{this.props.todo.done ? "Undo" : "Done"}</button>
            
            {this.state.detail ? <TodoDetailViewContainer todo={this.props.todo} removeTodo={this.props.removeTodo}/> : ""}
        </li>
        )
    }

    detailClickHandler(e){
        this.setState({detail: !this.state.detail})
    }
    
    toggleDone(todo) {
        return {
            id: todo.id,
            title: todo.title,
            body: todo.body,
            done: !todo.done
        }
    }
}



export default TodoListItem