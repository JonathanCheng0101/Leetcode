WITH t AS(
    SELECT e.left_operand, v1.value AS `x`, e.operator, e.right_operand, v2.value AS `y`
    FROM Expressions e
    JOIN Variables v1
    ON e.left_operand = v1.name 
    JOIN Variables v2
    ON e.right_operand = v2.name
)
SELECT left_operand,
       operator,
       right_operand,
       CASE WHEN (operator = '>' AND `x`>`y`) OR (operator = '=' AND `x`=`y`) OR (operator = '<' AND `x`<`y`) THEN 'true' ELSE 'false' END AS value
FROM t