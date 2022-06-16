const APIUtil = {
    followUser: id => {
        return $.ajax({
            method: "POST",
            url: `/users/${id}/follow`,
            //data: {},
            dataType: "JSON"
        })
    },
  
    unfollowUser: id => {
        return $.ajax({
            method: "DELETE",
            url: `/users/${id}/follow`,
            //data: {},
            dataType: "JSON"
        })
    }
  };
  
  module.exports = APIUtil;