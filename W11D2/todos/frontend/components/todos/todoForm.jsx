import React from 'react'
import { uniqueId } from '../../util/util'

class TodoForm extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            id: uniqueId(),
            title: "",
            body: "",
            done: false
        }
        this.handleSubmit = this.handleSubmit.bind(this)
        this.updateTitle = this.updateTitle.bind(this)
        this.updateBody = this.updateBody.bind(this)
    }

    handleSubmit(e) {
        e.preventDefault();
        this.props.createTodo(this.state)
            .then(() => this.setState({id: uniqueId(), title: '', body: ''}))
    }

    updateTitle(e) {
        this.setState({title: e.target.value})
    }

    updateBody(e) {
        this.setState({body: e.target.value})
    }
    
    render() {
        return(
            <form onSubmit={this.handleSubmit}>
                <h1>Add Todo:</h1>
                <label>Title:
                    <input type="text" value ={this.state.title} onChange={this.updateTitle}/>
                </label>
                <br/>
                <br/>
                <label>Body:
                    <textarea value ={this.state.body} onChange={this.updateBody} cols="30" rows="10">
                        {this.state.body}
                    </textarea>
                </label>
                <br/>
                <br/>
                <input type="submit" value="Add Todo Item!"/>
            </form>
        )
    }
}

export default TodoForm