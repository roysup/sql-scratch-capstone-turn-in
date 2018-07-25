-- Query for Part One: All columns of the 'survey' table, obtained from users taking the "Style Quiz"

SELECT *
FROM survey
LIMIT 10;


-- Query for Part Two: Breakdown of number of users per each 'question' taking the "Style Quiz" from the 'survey table'.

SELECT question,
   COUNT(DISTINCT user_id)
FROM survey
GROUP BY 1;


-- Query for Part Three: Breakdown of the skipping rates for each question, as compared to previous question in 'survey' table, by users taking the "Style Quiz"

SELECT  ROUND((100.0*q2/q1),2) AS q2_q1, ROUND((100.0*q3/q2),2) AS q3_q2, ROUND((100.0*q4/q3),2) AS q4_q3, ROUND((100.0*q5/q4),2) AS q5_q4 FROM (SELECT * FROM (SELECT COUNT(user_id) AS 'q1' FROM survey WHERE question LIKE '1.%')
CROSS JOIN (SELECT COUNT(user_id) AS 'q2' FROM survey WHERE question LIKE '2.%')
CROSS JOIN (SELECT COUNT(user_id) AS 'q3' FROM survey WHERE question LIKE '3.%')
CROSS JOIN (SELECT COUNT(user_id) AS 'q4' FROM survey WHERE question LIKE '4.%')
CROSS JOIN (SELECT COUNT(user_id) AS 'q5' FROM survey WHERE question LIKE '5.%'));


-- Query for Part Four: All coloumns of the 'quiz', 'home_try_on' and 'purchase' tables, obtained from users trying the "Home Try-On" Feature and "Style Quiz"

SELECT *
FROM quiz
LIMIT 5;

SELECT *
FROM home_try_on
LIMIT 5;

SELECT *
FROM purchase
LIMIT 5;


-- Query for Part Five: Creating a LEFT JOIN of ‘quiz’, ‘home_try_on’, and ‘purchase’ Tables. 


SELECT DISTINCT q.user_id,
h.user_id IS NOT NULL AS 'is_home_try_on',
h.number_of_pairs,
p.user_id IS NOT NULL AS 'is_purchase'

FROM quiz q
LEFT JOIN home_try_on h
ON  q.user_id = h.user_id
LEFT JOIN purchase p
ON p.user_id=q.user_id
LIMIT 10;


-- Query for Part Six A: Aggregates and Comparions from the LEFT JOIN of 'quiz', 'home_try_on' and 'purchase' tables

WITH funnels AS (SELECT DISTINCT q.user_id,
h.user_id IS NOT NULL AS 'is_home_try_on',
h.number_of_pairs,
p.user_id IS NOT NULL AS 'is_purchase'

FROM quiz q
LEFT JOIN home_try_on h
ON  q.user_id = h.user_id
LEFT JOIN purchase p
ON p.user_id=q.user_id)

SELECT number_of_pairs, COUNT(*) AS 'num_quiz',
   SUM(is_home_try_on) AS 'num_home_try_on',
   SUM(is_purchase) AS 'num_purchase',
  ROUND (100.0 * SUM(is_home_try_on) / (COUNT (user_id)),2) AS 'quiz_to_home_try_on',
   ROUND(100.0 * SUM(is_purchase) / SUM(is_home_try_on),2) AS 'home_try_on_to_purchase'
FROM funnels
GROUP BY number_of_pairs
ORDER BY number_of_pairs;


-- Query for Part Six B: 'style' breakdown per users from 'quiz' table

SELECT COUNT (style)
FROM quiz
WHERE style LIKE 'Women%';

SELECT COUNT (style)
FROM quiz
WHERE style LIKE 'Men%';

SELECT COUNT (style)
FROM quiz
WHERE style LIKE 'I%';


-- Query for Part Six B: 'fit'  breakdown per users from 'quiz' table

SELECT COUNT(fit) FROM quiz
WHERE fit LIKE 'N%';

SELECT COUNT(fit) FROM quiz
WHERE fit LIKE 'M%';

SELECT COUNT(fit) FROM quiz
WHERE fit LIKE 'W%';

SELECT COUNT(fit) FROM quiz
WHERE fit LIKE 'I%';


-- Query for Part Six B: 'shape'  breakdown per users from 'quiz' table

SELECT COUNT (shape)
FROM quiz
WHERE shape LIKE 'Re%';

SELECT COUNT (shape)
FROM quiz
WHERE shape LIKE 'Ro%';

SELECT COUNT (shape)
FROM quiz
WHERE shape LIKE 'S%';

SELECT COUNT (shape)
FROM quiz
WHERE shape LIKE 'N%';


-- Query for Part Six B: 'color'  breakdown per users from 'quiz' table

SELECT COUNT (color)
FROM quiz
WHERE style LIKE 'To%';

SELECT COUNT (color)
FROM quiz
WHERE color LIKE 'B%';

SELECT COUNT (color)
FROM quiz
WHERE color LIKE 'Tw%';

SELECT COUNT (color)
FROM quiz
WHERE color LIKE 'C%';

SELECT COUNT (color)
FROM quiz
WHERE  color LIKE 'N%';


-- Query for Part Six C: 'product_id'  breakdown per users from 'purchase' table

SELECT COUNT (product_id)
FROM purchase
WHERE product_id = 1;

SELECT COUNT (product_id)
FROM purchase
WHERE product_id = 2;

SELECT COUNT (product_id)
FROM purchase
WHERE product_id = 3;

SELECT COUNT (product_id)
FROM purchase
WHERE product_id = 4;

SELECT COUNT (product_id)
FROM purchase
WHERE product_id = 5;

SELECT COUNT (product_id)
FROM purchase
WHERE product_id = 6;

SELECT COUNT (product_id)
FROM purchase
WHERE product_id = 7;

SELECT COUNT (product_id)
FROM purchase
WHERE product_id = 8;

SELECT COUNT (product_id)
FROM purchase
WHERE product_id = 9;

SELECT COUNT (product_id)
FROM purchase
WHERE product_id = 10;


-- Query for Part Six C: 'style'  breakdown per users from 'purchase' table

SELECT COUNT (style)
FROM purchase
WHERE style LIKE 'Women%';

SELECT COUNT (style)
FROM purchase
WHERE style LIKE 'Men%';


-- Query for Part Six C: 'model_name'  breakdown per users from 'purchase' table

SELECT COUNT (model_name) 
FROM purchase
WHERE model_name LIKE 'L%';

SELECT COUNT (model_name) 
FROM purchase
WHERE model_name LIKE 'D%';

SELECT COUNT (model_name) 
FROM purchase
WHERE model_name LIKE 'E%';

SELECT COUNT (model_name) 
FROM purchase
WHERE model_name LIKE 'B%';

SELECT COUNT (model_name) 
FROM purchase
WHERE model_name LIKE 'M%';

SELECT COUNT (model_name) 
FROM purchase
WHERE model_name LIKE 'O%';


-- Query for Part Six C: 'color'  breakdown per users from 'purchase' table

SELECT COUNT (color) FROM purchase
WHERE color LIKE 'J%';

SELECT COUNT (color) FROM purchase
WHERE color LIKE 'Elde%';

SELECT COUNT (color) FROM purchase
WHERE color LIKE 'Rosew%';

SELECT COUNT (color) FROM purchase
WHERE color LIKE 'D%';

SELECT COUNT (color) FROM purchase
WHERE color LIKE 'S%';

SELECT COUNT (color) FROM purchase
WHERE color LIKE 'Enda%';

SELECT COUNT (color) FROM purchase
WHERE color LIKE 'L%';

SELECT COUNT (color) FROM purchase
WHERE color LIKE 'Rose C%';

SELECT COUNT (color) FROM purchase
WHERE color LIKE 'P%';


-- Query for Part Six C: 'price'  breakdown per users from 'purchase' table

SELECT COUNT (price) 
FROM purchase
WHERE price = 150;

SELECT COUNT (price) 
FROM purchase
WHERE price = 95;

SELECT COUNT (price) 
FROM purchase
WHERE price = 50;





