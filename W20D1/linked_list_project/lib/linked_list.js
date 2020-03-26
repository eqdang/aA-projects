// ============================================================================
// Implementation Exercise: Singly Linked List
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement a Singly Linked List and all of its methods below!
//
// ------------
// Constraints:
// ------------
//
// Make sure the time and space complexity of each is equivalent to those 
// in the table provided in the Time and Space Complexity Analysis section
// of your Linked List reading!
//
// -----------
// Let's Code!
// -----------

// TODO: Implement a Linked List Node class here
class Node {
    constructor(val) {
			this.value = val;
			this.next = null;
			// this.length = 0;
    }

}

// TODO: Implement a Singly Linked List class here
class LinkedList {
    constructor() {
			this.head = false;
			this.tail = false;
			this.length = 0;
			this.list = {};
    }

    // TODO: Implement the addToTail method here
    addToTail(val) {
			const newNode = new Node(val);

			if (this.tail) {
				this.tail = newNode;
				this.tail.next = newNode;
				this.length++;
			} else if (this.tail === false) {
				this.head = newNode;
				this.tail = newNode;
				this.length++;
		}
		return this;
	}

    // TODO: Implement the removeTail method here
    removeTail() {
			if (Object.keys(this.list).length === 0) return undefined;
			
			let current = this.head;
			let newTail = current;

			while (current.next) {
				newTail = current;
				current = current.next;
			}

			this.tail = newTail;
			this.tail.next = null;
			this.length -= 1;
			if (this.length === 0) {
				this.head = null;
				this.tail = null;
			}
			return current && this.length;
    }

    // TODO: Implement the addToHead method here
    addToHead(val) {
			let newNode = new Node(val);
			if (!this.head) {
				this.head = newNode;
				this.tail = newNode;
				this.length += 1;
			} else {
				this.head = newNode;
				this.head.next = null;
				this.length += 1;
			}
			return this;
    }

    // TODO: Implement the removeHead method here
    removeHead() {
			if (Object.keys(this.list).length === 0) return undefined;
			let removed = this.head;
			if (this.length === 1) {
				this.tail = null;
				this.head = null;
				this.length--;
			} else {
				this.head = this.head.next;
				this.length--;
			}
			return removed;

			// const currentHead = this.head;
			// this.head = currentHead.next;
			// this.length -= 1;
			// if (this.length === 0) {
			// 	this.nail = null;
			// }
			// return currentHead && this.length;
    }

    // TODO: Implement the contains method here
    contains(target) {
			let node = this.head;
			while (node) {
				if (node.value === target) return true;
				node = node.next;
			}
			return false;
    }

    // TODO: Implement the get method here
    get(index) {
			if (index < 0 || index >= this.length) return null;
			let counter = 0;
			let current = this.head;
			while (counter !== index) {
				current = current.next;
				counter++;
			}
			return current;
    }

    // TODO: Implement the set method here
    set(index, val) {
			const foundNode = this.get(index);
			if (foundNode) {
				foundNode.value = val;
				return true;
			}
			return false;
    }

    // TODO: Implement the insert method here
    insert(index, val) {
			if (index < 0 || index >= this.length) return false;
			if (index === this.length) return !!this.addToTail(val);
			if (index === 0) return !!this.addToHead(val);

			const newNode = new Node(val);
			const prev = this.get(index - 1);
			const temp = prev.next;
			prev.next = newNode;
			newNode.next = temp;
			this.length++;
			return true;
    }

    // TODO: Implement the remove method here
    remove(index) {
			if (index < 0 || index >= this.length) return undefined;
			if (index === 0) return this.removeHead();
			if (index === this.length - 1) return this.removeTail();
			const previousNode = this.get(index - 1);
			const removed = previousNode.next;
			previousNode.next = removed.next;
			this.length--;
			return removed;
    }

    // TODO: Implement the size method here
    size() {
			return this.length;
    }
}

exports.Node = Node;
exports.LinkedList = LinkedList;
