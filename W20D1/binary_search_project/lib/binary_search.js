function binarySearch(array, target) {
	if (array.length === 0) return false;

	let midIdx = Math.floor(array.length/2);
	let leftHalf = array.slice(0, midIdx);
	let rightHalf = array.slice(midIdx +1);

	if (target < array[midIdx]) {
		return binarySearch(leftHalf, target);
	} else if (target > array[midIdx]) {
		return binarySearch(rightHalf, target);
	} else {
		return true;
	}
}

function binarySearchIndex(array, target, lo=0, hi=array.length -1) {
	if (lo === hi) return -1;

	let midIdx = Math.floor((lo+hi) /2);

	if (target < array[midIdx]) {
		return binarySearchIndex(array, target, lo, midIdx);
	} else if (target > array[midIdx]) {
		return binarySearchIndex(array, target, midIdx + 1, hi);
	} else {
		return midIdx;
	}

	// if (array.length === 0) return -1;
	// let midIdx = Math.floor(array.length /2);
	// let leftHalf = array.slice(0, midIdx);
	// let rightHalf = array.slice(midIdx +1);

	// if (target === array[midIdx]) {
	// 	return midIdx;
	// } else if (target > array[midIdx]) {
	// 	return binarySearchIndex(rightHalf, target);
	// } else if (target < array[midIdx]) {
	// 	return binarySearchIndex(leftHalf, target);
	// }
	// 	return -1;

}

// Time Complexity: O(log(n))
// n is the length of the input array
// We have no loops, so we must only consider the number of recursive calls it takes to hit the base case
// The number of recursive calls is the number of times we must halve the array until it's length becomes 0. This number can be described by log(n)
// for example, say we had an array of 8 elements, n = 8
// the length would halve as 8 -> 4 -> 2 -> 1
// it takes 3 calls, log(8) = 3
// Space Complexity: O(n)
// Our implementation uses n space due to half arrays we create using slice.Note that JavaScript slice creates a new array, so it requires additional memory to be allocated.

module.exports = {
    binarySearch,
    binarySearchIndex
};