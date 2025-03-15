-- 1. Kysely, joka sisältää 'AS' avainsanan
SELECT username AS user_name, email AS user_email FROM Users;

-- 2. Kysely, joka sisältää 'OR' avainsanan
SELECT * FROM Users WHERE email LIKE '%gmail.com' OR email LIKE '%outlook.com';

-- 3. Kysely, joka sisältää 'AND' avainsanan
SELECT * FROM Users WHERE '2024-01-02' > created_at AND username LIKE '%one%';

-- 4. Aggregaattifunktio: Lasketaan käyttäjien määrä
SELECT COUNT(*) AS total_users FROM Users;

-- 5. Aggregaattifunktio: Lasketaan viestien määrä käyttäjää kohden
SELECT sender_id, COUNT(*) AS message_count FROM Messages GROUP BY sender_id;

-- 6. Aggregaattifunktio: Lasketaan ryhmien määrä
SELECT COUNT(*) AS total_groups FROM Groups;

-- 7. Kysely, joka sisältää 'GROUP BY' avainsanan
SELECT interest_id, COUNT(user_id) AS user_count FROM userinterests GROUP BY interest_id;

-- 8. Kysely, joka sisältää 'HAVING' avainsanan
SELECT interest_id, COUNT(user_id) AS user_count FROM userinterests GROUP BY interest_id HAVING COUNT(user_id) > 5;

-- 9. Kysely, joka sisältää LEFT JOIN -liitoksen
SELECT Users.username, Groups.group_name FROM Users
LEFT JOIN UserGroups ON Users.user_id = UserGroups.user_id
LEFT JOIN Groups ON UserGroups.group_id = Groups.group_id;

-- 10. Kysely, joka sisältää INNER JOIN -liitoksen
SELECT Users.username, interests.interest_name FROM Users
INNER JOIN userinterests ON Users.user_id = userinterests.user_id
INNER JOIN interests ON userinterests.interest_id = interests.interest_id;
