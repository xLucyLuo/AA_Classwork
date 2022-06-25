import React from "react"

class Clock extends React.Component {

  constructor(props) {
    super(props) 
    this.state = {time: new Date()}
    this.tick = this.tick.bind(this)
  }
  
  componentWillUnmount() {
    clearInterval(this.tickInterval)
  }

  componentDidMount() {
    this.tickInterval = setInterval(this.tick, 1000)
  }

  tick() {
    this.setState({time: new Date()})
  }

  render() {
    return (
      <div className="clock">
        <h1 className="title">Clock</h1>
        <p className="data">{this.state.time.getHours()}:{this.state.time.getMinutes()}:{this.state.time.getSeconds()} PDT</p>
        <p className="data">{this.state.time.toLocaleString('en-US', { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' })}</p>
      </div>
    )
  }
}

export default Clock