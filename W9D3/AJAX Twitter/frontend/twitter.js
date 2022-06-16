const FollowToggle = require('./follow_toggle.js');

$(()=>{
    const $btnToggles = $(".follow-toggle")
    $btnToggles.each((idx, el)=>{
        return new FollowToggle(el)
    })

})
