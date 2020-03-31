function FollowToggle($el) {
    this.userId = $el.data('user-id');
    this.followState = $el.data('initial-follow-state');
    this.$el = $el;
    this.$el.on('click', this.handleClick.bind(this));
    this.render();
}

FollowToggle.prototype.render = function () {
    const buttonText = (this.followState === "unfollowed") ? "Follow!" : "Unfollow!";
    this.$el.text(buttonText);
}

FollowToggle.prototype.toggleFollowState = function () {
    this.followState = (this.followState === "unfollowed") ? 'followed' : 'unfollowed';
}

FollowToggle.prototype.handleClick = function (e) {
    e.preventDefault();
    const requestMethod = (this.followState === "unfollowed") ? 'POST' : 'DELETE';
    const requestURL = `/users/${this.userId}/follow`;
    let that = this;
    $.ajax({
        type: requestMethod,
        url: requestURL,
        success(data) {
            console.log('followed!');
            that.toggleFollowState();
            that.render();
        },
        error() {
            console.log('followtoggle error');
        }
    });
    // let that = this;
}

module.exports = FollowToggle;