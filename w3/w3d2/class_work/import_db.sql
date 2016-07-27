DROP TABLE if exists users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);


DROP TABLE if exists questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
);


DROP TABLE if exists question_follows;

CREATE TABLE question_follows (
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);


DROP TABLE if exists replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);


DROP TABLE if exists question_likes;

CREATE TABLE question_likes (
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('lily', 'kwan'),
  ('linda', 'zhang'),
  ('valerie', 'lu');

INSERT INTO
  questions (title, body, user_id)
VALUES
  ('food', 'whats your favorite food?',
    (SELECT id FROM users WHERE fname = 'lily')),
  ('theme park', 'lets go to disney next wkend??',
    (SELECT id FROM users WHERE fname = 'linda')),
  ('day', 'whats your favorite weekday',
    (SELECT id FROM users WHERE fname = 'lily'));

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'linda'),
    (SELECT id FROM questions WHERE title = 'food')),
  ((SELECT id FROM users WHERE fname = 'valerie'),
    (SELECT id FROM questions WHERE title = 'theme park'));

INSERT INTO
  replies (body, question_id, parent_reply_id, user_id)
VALUES
  ('icecream', (SELECT id FROM questions WHERE title = 'food'), NULL,
    (SELECT id FROM users WHERE fname = 'linda'));

INSERT INTO
  replies (body, question_id, parent_reply_id, user_id)
VALUES
  ('yay birite', (SELECT id FROM questions WHERE title = 'food'),
    (SELECT id FROM replies WHERE body = 'icecream'),
    (SELECT id FROM users WHERE fname = 'lily'));

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'valerie'),
   (SELECT id FROM questions WHERE title = 'food')),
  ((SELECT id FROM users WHERE fname = 'linda'),
   (SELECT id FROM questions WHERE title = 'food')),
  ((SELECT id FROM users WHERE fname = 'lily'),
   (SELECT id FROM questions WHERE title = 'theme park'));
