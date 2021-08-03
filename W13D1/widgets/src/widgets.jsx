import ReactDOM from 'react-dom';
import React from 'react';
import Clock from './clock';
import Tab from './tab';

console.log("it works")

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");


    ReactDOM.render(
        <div>
            <Clock />
            <Tab banana="taco" />
        </div>, 
        root);
});