function quickSort(array) {
if (array.length <= 1) return array;

let pivot = array.shift();
let left = array.filter(el => el < pivot);
let right = array.filter(el => el >= pivot);

let leftSorted = quickSort(left);
let rightSorted = quickSort(right);

// return leftSorted.concat(pivot).concat(rightSorted);
return [...leftSorted, pivot, ...rightSorted ];
}

function partition(array, pivot) {
if (array.length <= 1) return array;

	let left = [];
	let right = [];

array.forEach(el => {
	if (el < pivot) {
		left.push(el);
	} else {
		right.push(el);
	}
});
	return [left, right];
}


function partitian(array, pivot) {
	let left = array.filter(el => el < pivot);
	let right = array.filter(el => el >= pivot);
	return [left, right];
}

module.exports = {
    quickSort
};