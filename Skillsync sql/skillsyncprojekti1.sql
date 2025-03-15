CREATE DATABASE SkillSync 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_swedish_ci;

USE SkillSync;


CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(150) NOT NULL UNIQUE,
    username VARCHAR(100) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    password_hash VARCHAR(255) NOT NULL
);

CREATE TABLE Groups (
    group_id INT AUTO_INCREMENT PRIMARY KEY,
    group_name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE UserGroups (
    user_group_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    group_id INT NOT NULL,
    joined_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (group_id) REFERENCES Groups(group_id) ON DELETE CASCADE
);

CREATE TABLE Interests (
    interest_id INT AUTO_INCREMENT PRIMARY KEY,
    interest_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE UserInterests (
    user_interest_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    interest_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (interest_id) REFERENCES Interests(interest_id) ON DELETE CASCADE
);

CREATE TABLE Messages (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    content TEXT NOT NULL,
    sent_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    metadata JSON,
    FOREIGN KEY (sender_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (receiver_id) REFERENCES Users(user_id) ON DELETE CASCADE
);


-- Testidatan lisääminen
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