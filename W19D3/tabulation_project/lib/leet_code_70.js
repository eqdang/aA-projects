// Work through this problem on https://leetcode.com/problems/climbing-stairs/ and use the specs given there.
// Feel free to use this file for scratch work.
// You are climbing a stair case. It takes n steps to reach to the top. Each time you either climb 1 or 2 steps. In how many disticnt ways can you climb to the top? 


function climbStairs(n) {
	let table = new Array(n+1);
	table[0] = 1;
	table[1] = 1;

	for (let i=2; i < table.length; i++) {
		table[i] = table[i-1] + table[i-2];
	}

	return table[table.length-1]
}