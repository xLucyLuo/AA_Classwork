import TodoDetailView from "./todoDetailView";
import {connect} from 'react-redux';
import {receiveSteps, receieveStep, removeStep} from '../../actions/stepActions';
import {allSteps} from '../../reducers/selectors';

const mapStateToProps = (state) => ({
    steps: allSteps(state)
})

const mapDispatchToProps = (dispatch) => ({
    receiveSteps: (steps) => dispatch(receiveSteps(steps)),
    receieveStep: (step) => dispatch(receieveStep(step)), 
    removeStep: (step) => dispatch(removeStep(step))
})


export default connect(mapStateToProps, mapDispatchToProps)(TodoDetailView)