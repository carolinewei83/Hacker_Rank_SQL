-- Question
# You are given a table, BST, containing two columns:
# N and P, where N represents the value of a node in Binary Tree,
# and P is the parent of N.

-- Link:https://www.hackerrank.com/challenges/the-company/problem
# Write a query to find the node type of Binary Tree ordered by the value of the node.
# Output one of the following for each node:
#
# Root: If node is root node.
# Leaf: If node is leaf node.
# Inner: If node is neither root nor leaf node.

# SQL Interview
# •	GROUP BY
# •	HAVING
# •	ORDER BY

-- My Solution
SELECT CASE
           WHEN P IS NULL THEN CONCAT(N, ' Root')
           WHEN N IN (SELECT DISTINCT P FROM BST) THEN CONCAT(N, ' Inner')
           ELSE CONCAT(N, ' Leaf')
           END
FROM BST
ORDER BY N ASC;

-- Solution 2
SELECT n,
       CASE
           WHEN p IS NULL THEN 'Root'
           WHEN EXISTS (SELECT * FROM bst in_bst WHERE in_bst.p = out_bst.n) THEN 'Inner'
           ELSE 'Leaf'
           END
FROM bst out_bst
ORDER BY n;


-- Solution 3
SELECT n,
       CASE
           WHEN p IS NULL THEN 'Root'
           WHEN n IN (SELECT bst_1.p FROM bst bst_1 JOIN bst bst_2 ON bst_1.p = bst_2.n) THEN 'Inner'
           ELSE 'Leaf'
           END
FROM bst
ORDER BY n;


-- Solution 4
SELECT n, IF(p IS NULL, 'Root', IF((SELECT COUNT(*) FROM bst in_bst WHERE in_bst.p = out_bst.n) > 0, 'Inner', 'Leaf'))
FROM bst out_bst
ORDER BY n;