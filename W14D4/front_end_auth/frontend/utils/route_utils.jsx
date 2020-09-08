import React from 'react';
import { connect } from 'react-redux';
import { Redirect, Route, withRouter } from 'react-router-dom';
/Users/eqdang/Desktop/app_academy/aa-classwork/W14D4/front_end_auth/frontend/utils/route_utils.jsx
const mapStateToProps = state => ({
    loggedIn: Boolean(state.session.currentUser),
});

const Auth = ({ component: Component, path, loggedIn }) => (
    <Route
        path={path}
        render={props = (

        )}
);