const Util = {
  inherits(childClass, parentClass) {
    // childClass.prototype = parentClass.prototype
    // childClass.prototype.__proto__ === parentClass.prototype
    
    // function Surrogate () {}
    // Surrogate.prototype = parentClass.prototype;
    // childClass.prototype = new Surrogate();
    childClass.prototype = Object.create(parentClass.prototype);
    childClass.prototype.constructor = childClass;
  },

    randomVec(length) {
        const deg = 2 * Math.PI * Math.random();
        return Util.scale([Math.sin(deg), Math.cos(deg)], length);
    },
    scale(vec, m) {
        return [vec[0] * m, vec[1] * m];
    }
}
// someFunction.inherits(otherFunction)
// inherits(someFunction, otherFunction)

module.exports = Util;


