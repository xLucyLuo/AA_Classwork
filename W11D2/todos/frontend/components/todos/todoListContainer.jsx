import TodoList from './todoList'
import {connect} from 'react-redux'
import {receiveTodo, receiveTodos, removeTodo, fetchTodos, createTodo} from '../../actions/todoActions'
import {allTodos} from '../../reducers/selectors'

const mapStateToProps = (state) => ({
    todos: allTodos(state)
})

const mapDispatchToProps = (dispatch) => ({
    receiveTodo: (todo) => dispatch(receiveTodo(todo)),
    receiveTodos: (todos) => dispatch(receiveTodos(todos)),
    removeTodo: (todo) => dispatch(removeTodo(todo)),
    fetchTodos: (todos) => dispatch(fetchTodos(todos)),
    createTodo: (todo) => dispatch(createTodo(todo))
})

export default connect(mapStateToProps, mapDispatchToProps)(TodoList)