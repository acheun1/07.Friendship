/*Friendship
2018 09 28 
Cheung Anthony
*/

#Return all users who are friends with Kermit, make sure their names are displayed in results.

SELECT * FROM twitter.friendships LIMIT 10
SELECT * FROM twitter.users LIMIT 10

	SELECT 
		A.first_name,
		A.last_name,
		C.first_name AS friend_first,
		C.last_name AS friend_last
FROM 
	twitter.users A
LEFT JOIN 
	twitter.friendships B
ON A.id=B.friend_1_id
LEFT JOIN
	twitter.users C
ON C.id=B.friend_2_id
		WHERE A.first_name like '%kermit%'
    
#Return the count of all friendships
SELECT
	COUNT(DISTINCT friend_1_id)
FROM 
	twitter.friendships

#Find out who has the most friends and return the count of their friends.

	SELECT 
		A.first_name,
		A.last_name,
        COUNT(DISTINCT B.friend_1_id) AS cnt
FROM 
	twitter.users A
LEFT JOIN 
	twitter.friendships B
ON A.id=B.friend_1_id
ORDER BY cnt DESC

#Create a new user and make them friends with Eli Byers, Kermit The Frog, and Marky Mark

/*inserting record*/
INSERT INTO twitter.users (id,first_name,last_name) VALUES ('6','Some','Person');

INSERT INTO twitter.friendships (friend_1_id,friend_2_id) VALUES ('6','2');
INSERT INTO twitter.friendships (friend_1_id,friend_2_id) VALUES ('6','4');
INSERT INTO twitter.friendships (friend_1_id,friend_2_id) VALUES ('6','5');

#Return the friends of Eli in alphabetical order

	SELECT 
		A.first_name,
		A.last_name,
		C.first_name AS friend_first,
		C.last_name AS friend_last
FROM 
	twitter.users A
LEFT JOIN 
	twitter.friendships B
ON A.id=B.friend_1_id
LEFT JOIN
	twitter.users C
ON C.id=B.friend_2_id
	WHERE A.first_name like '%eli%'
ORDER BY friend_first 

#Remove Marky Marky from Eli’s friends.

DELETE FROM twitter.friendships WHERE friend_1_id='2' AND friend_2_id='4' 
SELECT * FROM twitter.users WHERE friend_1_id='2' AND friend_2_id='4'

#Return all friendships, displaying just the first and last name of both friends

	SELECT 
		A.first_name,
		A.last_name,
		C.first_name AS friend_first,
		C.last_name AS friend_last
FROM 
	twitter.users A
LEFT JOIN 
	twitter.friendships B
ON A.id=B.friend_1_id
LEFT JOIN
	twitter.users C
ON C.id=B.friend_2_id

