import { combineReducers } from 'redux'
import todosReducer from './todosReducer'
import stepsReducer from "./stepsReducer"

export const rootReducer = combineReducers({
    todos: todosReducer,
    steps: stepsReducer
})

