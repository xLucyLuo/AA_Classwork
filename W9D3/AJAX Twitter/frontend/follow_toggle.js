const APIUtil = require("./api_util.js")

class FollowToggle{

    constructor(el){
        this.$el = $(el);

        this.userId = this.$el.attr("user-id");
        this.followState = this.$el.attr("initial-follow-state");
        this.render();
        this.$el.on("click", this.handleClick.bind(this));
    }

    render(){
        if (this.followState === "followed"){
            this.$el.text("Unfollow!")
        }else if (this.followState === "unfollowed"){
            this.$el.text("Follow!")
        }

        console.log(this)

        if (this.followState ==="processing"){
            this.$el.prop("disabled",true)
            this.$el.text("Processing")
        }else{
            this.$el.prop("disabled",false)
        }
    }
    
    handleClick(e){
        e.preventDefault();
        
        // console.log(this)
        if (this.followState === "followed"){
            this.followState = "processing"
            this.render()
            console.log(this)
            APIUtil.unfollowUser(this.userId)
            .then(this.followState ="unfollowed")
            .then(this.render())
        }else if (this.followState === "unfollowed"){
            this.followState = "processing"
            this.render()
            console.log(this)
            APIUtil.followUser(this.userId)
            .then(this.followState ="followed")
            .then(this.render())
        }
    }
}

module.exports = FollowToggle