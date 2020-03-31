const FollowToggle = require("./follow_toggle.js");

$(() => {
    console.log('entry file loaded!');
    $('button.follow-toggle').each( (_idx, button) => {
        let $button = $(button);
        const followToggle = new FollowToggle($button);
    });
});