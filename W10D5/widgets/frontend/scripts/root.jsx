import React from "react"
import Clock from "./clock.jsx"
import Tabs from "./tabs.jsx"


const Root = () => {
    const tabs = [{title:"react", content:"need to know"},
                        {title:"ruby", content:"fav"},
                        {title:"javascript", content:"the main"}]
    return (
        <div className="root">
            <Clock/>
            <Tabs tabs={tabs}/>
        </div>
    )
}


export default Root