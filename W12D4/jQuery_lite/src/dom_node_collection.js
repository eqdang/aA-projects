class DOMNodeCollection {
    constructor(array) {
        this.htmlElements = array;
    }

    html(html) {
        if (typeof html === 'string') {
            this.htmlElements.forEach((ele) => {
                ele.innerHTML = html;
        });
    }

    append(object) {
        if (object instanceof DOMNodeCollection) {
            object.htmlElements.forEach((outer_el) => {
                this.htmlElements.forEach((inner_el) => {
                    inner_el.innerHTML += outer_el.outerHTML;
                });
            });
        } else if (object instanceof HTMLElement) {
            this.htmlElements.forEach((el) => {
                el.innerHTML += object.outerHTML;
            });
        } else {
            this.htmlElements.forEach((el) => {
                el.innerHTML += `${object}`;
            });
        }
    }

    
    
}

module.exports = DOMNodeCollection;
