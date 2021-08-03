// ============================================================================
// Implementation Exercise: Queue
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement a Queue and all of its methods below!
//
// ------------
// Constraints:
// ------------
//
// Make sure the time and space complexity of each is equivalent to those 
// in the table provided in the Time and Space Complexity Analysis section
// of your Stack reading!
//Data Structure Operation	Time Complexity (Avg)	Time Complexity (Worst)	Space Complexity (Worst)
// Access	Θ(n)	O(n)	O(n)
// Search	Θ(n)	O(n)	O(n)
// Insertion	Θ(1)	O(1)	O(n)
// Deletion	Θ(1)	O(1)	O(n)
// -----------
// Let's Code!
// -----------

class Node {
	constructor(val) {
		this.value = val;
		this.next = null;
	}
}

class Queue {
	constructor() {
		this.front = null;
		this.back = null;
		this.length = 0;
	}

	enqueue(val) {
		const newNode = new Node(val);

		if (!this.front) {
			this.front = newNode;
			this.back = newNode;
		} else {
			this.back.next = newNode;
			this.back = newNode;
		}
		return ++this.length;
	}

	dequeue() {
		if (!this.front) return null;

		const temp = this.front;
		if (this.front === this.back) {
			this.back = null;
		}
		this.front = this.front.next;
		this.length--;
		return temp.value;
	}

	size() {
		return this.length;
	}
}

exports.Node = Node;
exports.Queue = Queue;