import React from 'react'
import ReactDOM from 'react-dom'
import configureStore from './store/store.js'
import Root from './components/root'
import {allTodos} from './reducers/selectors'
import * as TodoAPIUtil from './util/todoApiUtil.js'
import { fetchTodos } from './actions/todoActions'


import {receiveTodo, receiveTodos, removeTodo} from './actions/todoActions'

document.addEventListener("DOMContentLoaded", () => {
    const store = configureStore()
    ReactDOM.render(<Root store={store}/>, document.getElementById("root"))
    
    window.store = store
    const todos = allTodos(store.getState())
    window.todos = todos
    window.receiveTodo = receiveTodo
    window.receiveTodos = receiveTodos
    window.removeTodo = removeTodo
    window.TodoAPIUtil = TodoAPIUtil
    window.fetchTodos = fetchTodos
})


