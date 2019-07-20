/* Assignment – SQL One to Many Relationships */

create database movies;

use movies;

/* 1. Videos table. Create one table to keep track of the videos. 
This table should include a unique ID, the title of the video, the length in minutes, and the URL. 
Populate the table with at least three related videos from YouTube or other publicly available resources. */

CREATE TABLE Videos(video_id int PRIMARY KEY,title varchar(100) NOT NULL,length int NOT NULL,url varchar(200) NOT NULL);

INSERT INTO Videos ( video_id, title, length, url ) VALUES ( 1, 'Narcos', 10 , 'https://youtu.be/VBLcYJ7C4F0');
INSERT INTO Videos ( video_id, title, length, url ) VALUES ( 2, 'Stranger Things', 12 , 'https://youtu.be/w0i3NH0Zrfg');
INSERT INTO Videos ( video_id, title, length, url ) VALUES ( 3, 'MasterChef', 5,'https://youtu.be/4zeCfPgTPsM');


/* 2. Create and populate Reviewers table. Create a second table that provides at least two user reviews for each 
of at least two of the videos. These should be imaginary reviews that include columns for the 
user’s name (“Asher”, “Cyd”, etc.), the rating (which could be NULL, or a number between 0 and 5), 
and a short text review (“Loved it!”). There should be a column that links back to the ID column in the table of videos.*/

CREATE TABLE Reviews (review_id int PRIMARY KEY, video_id int NOT NULL REFERENCES Videos,user varchar(50) NOT NULL,
rating int,review varchar(50) NOT NULL);

INSERT INTO Reviews ( review_id, video_id, user, rating, review ) VALUES ( 1, 1, 'Asher',5,'Very Interesting');
INSERT INTO Reviews ( review_id, video_id, user, rating, review ) VALUES ( 2, 1, 'Cyd',5,'Loved it');
INSERT INTO Reviews ( review_id, video_id, user, rating, review ) VALUES ( 3, 2, 'Tom',2,'Boring');
INSERT INTO Reviews ( review_id, video_id, user, rating, review ) VALUES ( 4, 2, 'Smith',1,'Could be improved');
INSERT INTO Reviews ( review_id, video_id, user, rating, review ) VALUES ( 5, 3, 'John',NULL,'Good');
INSERT INTO Reviews ( review_id, video_id, user, rating, review ) VALUES ( 6, 3, 'Jack',4,'Awesome program');


/* 3. Report on Video Reviews. Write a JOIN statement that shows information from both tables. */

SELECT v.title,v.length,v.url,r.rating,r.review from Videos v join Reviews r on v.video_id=r.video_id;


