-- 3. Testidatan lisääminen
INSERT INTO Users (email, username, password_hash, created_at) VALUES
('user1@outlook.com', 'UserOne', 'hashedpassword1', '2024-01-01 10:00:00'),
('user2@gmail.com', 'UserTwo', 'hashedpassword2', '2024-02-20 14:30:00'),
('user3@outlook.com', 'UserThree', 'hashedpassword3', '2024-03-05 18:45:00');

INSERT INTO Groups (group_name, description, created_at) VALUES
('Developers', 'A group for software developers', '2024-01-10 12:00:00'),
('Gamers', 'A group for gaming enthusiasts', '2024-02-15 15:00:00'),
('Designers', 'A group for UX/UI designers', '2024-03-01 16:30:00');

INSERT INTO UserGroups (user_id, group_id) VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Interests (interest_name) VALUES
('Coding'),
('Gaming'),
('Design');

INSERT INTO UserInterests (user_id, interest_id) VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Messages (sender_id, receiver_id, content, metadata) VALUES
(1, 2, 'Hei, miten menee?', NULL),
(2, 3, 'Oletko koulussa?', '{"status": "urgent"}'),
(3, 1, 'Nähdään huomenna', '{"location": "kahvila"}');


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
