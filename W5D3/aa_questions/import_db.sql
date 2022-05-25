PRAGMA foreign_keys = ON;

-- DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

-- DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
    id INTEGER PRIMARY KEY, 
    title TEXT NOT NULL, 
    body TEXT NOT NULL, 
    author_id INTEGER NOT NULL, 
    
    FOREIGN KEY (author_id) REFERENCES users(id)
);

-- DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- DROP TABLE IF EXISTS replies;

CREATE TABLE replies (

    id INTEGER PRIMARY KEY, 
    question_id INTEGER NOT NULL, 
    user_id INTEGER NOT NULL,
    body TEXT NOT NULL,
    parent_reply_id INTEGER, 

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY, 
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
    users (fname, lname)
VALUES
    ('Lucy', 'Luo'),
    ('Tomoya', 'Kern');

INSERT INTO 
    questions (title, body, author_id)
VALUES
    ('Where Bathroom?', 'Where is the bathroom?!?', (SELECT id FROM users WHERE fname = 'Lucy' AND lname = 'Luo')),
    ('Lunch?', 'Did you bring lunch??!', (SELECT id FROM users WHERE fname = 'Tomoya' AND lname = 'Kern'));

INSERT INTO 
    question_follows (question_id, user_id)
VALUES
    ((SELECT id FROM questions WHERE title = 'Lunch?'), (SELECT id FROM users WHERE fname = 'Lucy')), 
    ((SELECT id FROM questions WHERE title = 'Lunch?'), (SELECT id FROM users WHERE fname = 'Tomoya')),
    ((SELECT id FROM questions WHERE title = 'Where Bathroom?'), (SELECT id FROM users WHERE fname = 'Tomoya'));


INSERT INTO 
    replies (question_id, user_id, body, parent_reply_id)
VALUES
    ((SELECT id FROM questions WHERE title = 'Lunch?'), (SELECT id FROM users WHERE fname = 'Lucy'), 'Nahh il go tmrw for sure', NULL),
    ((SELECT id FROM questions WHERE title = 'Lunch?'), (SELECT id FROM users WHERE fname = 'Tomoya'), 'You said that yesterday!', 1),
    ((SELECT id FROM questions WHERE title = 'Lunch?'), (SELECT id FROM users WHERE fname = 'Tomoya'), 'Ok so are you going out tomorrow?', 2),
    ((SELECT id FROM questions WHERE title = 'Lunch?'), (SELECT id FROM users WHERE fname = 'Lucy'), 'Ive git-committed to nothing!!', 3);

INSERT INTO 
    question_likes (question_id, user_id)
VALUES
    ((SELECT id FROM questions WHERE title = 'Where Bathroom?'), (SELECT id FROM users WHERE fname = 'Lucy')), 
    ((SELECT id FROM questions WHERE title = 'Lunch?'), (SELECT id FROM users WHERE fname = 'Tomoya')),
    ((SELECT id FROM questions WHERE title = 'Where Bathroom?'), (SELECT id FROM users WHERE fname = 'Tomoya'));