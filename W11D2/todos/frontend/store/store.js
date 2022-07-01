import {legacy_createStore as createStore, applyMiddleware} from 'redux'
import { rootReducer } from '../reducers/rootReducer'
import thunk from '../middleware/thunk'
import logger from 'redux-logger'


const configureStore = (preloadedState = {}) => {
    return createStore(
        rootReducer, 
        preloadedState,
        applyMiddleware(thunk, logger));
}

export default configureStore