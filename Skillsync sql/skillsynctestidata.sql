-- 3. Testidatan lisääminen
INSERT INTO Users (email, username, password_hash, created_at) VALUES
('user1@example.com', 'UserOne', 'hashedpassword1', '2024-01-15 10:00:00'),
('user2@example.com', 'UserTwo', 'hashedpassword2', '2024-02-20 14:30:00'),
('user3@example.com', 'UserThree', 'hashedpassword3', '2024-03-05 18:45:00');

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
(1, 2, 'Hello, how are you?', NULL),
(2, 3, 'Did you finish the project?', '{"status": "urgent"}'),
(3, 1, 'Let’s meet up tomorrow.', '{"location": "cafe"}');