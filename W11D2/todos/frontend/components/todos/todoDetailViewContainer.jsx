import TodoDetailView from "./todoDetailView";
import {connect} from 'react-redux';


const mapDispatchToProps = (dispatch) => ({
    removeTodo: (todo) => dispatch(removeTodo(todo))
})


export default connect(null, mapDispatchToProps)(TodoDetailView)