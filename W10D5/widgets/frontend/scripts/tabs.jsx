import React from "react"

class Tabs extends React.Component{
        constructor(props){
            super(props)
            this.state = {index: 0}
    }

    change(event) {
        event.preventDefault()
        let target = event.target
        this.setState({index: target.dataset.banana})
        // console.log(event.target.value)
    }
    
    render(){
        return (
        <div className="tabs">
            <ul>
                {this.props.tabs.map((el, idx) => {
                    return <li key={idx} data-banana={idx} onClick={this.change.bind(this)}>{el.title}</li>
                })}
            </ul>
            <p>{this.props.tabs[this.state.index].content}</p>
        </div>
        )
    }
}

export default Tabs