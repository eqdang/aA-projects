const DOMNodeCollection = require('.src/dom_node_collection.js');

console.log("index.js file loaded correctly wheee");

function $l(selector) {
    let cssSelector = document.querySelectorAll(selector);
    let selectArray = Array.from(cssSelector);
    return new DOMNodeCollection(selectArray);
}

window.$l = $l;