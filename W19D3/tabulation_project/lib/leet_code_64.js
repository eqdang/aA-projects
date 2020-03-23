// Work through this problem on https://leetcode.com/problems/minimum-path-sum/ and use the specs given there.
// Feel free to use this file for scratch work.
// Give a m x n grid filled w/ non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers-along its path. Yo ucan only move either down or right at any point in time.
// Input [[1,3,1],
//				[1,5,1],
//				[4,2,1]]
// Output: 7, 1>3>1>1>1

function minPathSum(grid) {
	let m = grid.length;
	let n = grid[0].length;

	let table = new Array(m).fill().map(() => new Array(n).fill(Infinity));
	table[0][0] = grid[0][0];

	for (let i = 0; i < m; i++) {
		for (let j = 0; j < n; j++) {
			if (j < n-1) {
				table[i][j+1] = Math.min(table[i][j] + grid[i][j+1], table[i][j+1]);
			}
			if (i < m-1) {
			table[i+1][j] = Math.min(table[i][j] + grid[i+1][j], table[i+1][j]);
			}
		}
	}
	return table[m-1][n-1];
}