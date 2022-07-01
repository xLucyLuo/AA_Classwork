import {RECEIVE_STEP, RECEIVE_STEPS, REMOVE_STEP} from "../actions/stepActions"

const stepsReducer = (state={}, action) => {
    Object.freeze(state)

    const nextState = Object.assign({}, state)

    switch (action.type) {
        case RECEIVE_STEPS:
            for(let step of action.steps){
                nextState[step.id] = step
            }
            return nextState
        case RECEIVE_STEP:
            nextState[action.step.id] = action.step
            return nextState
        case REMOVE_STEP:
            delete nextState[action.step.id]
            return nextState
        default:
            return state
    }
}

export default stepsReducer