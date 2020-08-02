PRAGMA foreign_keys = ON;

DROP TABLE replies;
DROP TABLE questions_likes;
DROP TABLE question_follows;
DROP TABLE questions;
DROP TABLE users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
) ;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
) ;

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  questions_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (questions_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
) ;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  parent_reply INTEGER,
  reply_user_id INTEGER NOT NULL,

  FOREIGN KEY (parent_reply) REFERENCES replies(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (reply_user_id) REFERENCES users(id)
) ;

CREATE TABLE questions_likes (
  id INTEGER PRIMARY KEY,
  like_user_id INTEGER NOT NULL,
  liked_question_id INTEGER NOT NULL,

  FOREIGN KEY (liked_question_id) REFERENCES questions(id),
  FOREIGN KEY (like_user_id) REFERENCES users(id)  
);


INSERT INTO
    users (fname, lname)
VALUES
  ('Michael', 'Powell'), ('Elizabeth', 'Dang');


INSERT INTO 
    questions (title, body, author_id)
VALUES
  ('How SQL?', 'I don''t know what i''m doing', (SELECT id FROM users WHERE users.fname = 'Michael' AND users.lname = 'Powell')),
  ('Why SQL?', 'I don''t know why i''m doing', (SELECT id FROM users WHERE users.fname = 'Elizabeth' AND users.lname = 'Dang'));


INSERT INTO
    replies (question_id, body, parent_reply, reply_user_id)
VALUES
  ((SELECT id FROM questions WHERE title = 'Why SQL?'), 
  'Because its great!', 
  NULL, 
  (SELECT id FROM users WHERE users.fname = 'Michael' AND users.lname = 'Powell')),

  ((SELECT id FROM questions WHERE title = 'Why SQL?'), 
  'I couldn''t agree more', 
  1, 
  (SELECT id FROM users WHERE users.fname = 'Elizabeth' AND users.lname = 'Dang'));


INSERT INTO
    question_follows (user_id, questions_id)
VALUES
    ((SELECT id FROM users WHERE users.fname = 'Michael'), (SELECT id FROM questions WHERE title = 'Why SQL?')),
    ((SELECT id FROM users WHERE users.fname = 'Elizabeth'), (SELECT id FROM questions WHERE title = 'Why SQL?')),
    ((SELECT id FROM users WHERE users.fname = 'Elizabeth'), (SELECT id FROM questions WHERE title = 'How SQL?'));


INSERT INTO
    questions_likes (like_user_id, liked_question_id)
VALUES
    ((SELECT id FROM users WHERE users.fname = 'Michael'), (SELECT id FROM questions WHERE title = 'Why SQL?')),
    ((SELECT id FROM users WHERE users.fname = 'Elizabeth'), (SELECT id FROM questions WHERE title = 'How SQL?'));

