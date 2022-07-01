import React from 'react'

const TodoDetailView = (props) => {

    return (
        <div>
            <p>{props.todo.body}</p>
        </div>
    )
}

export default TodoDetailView