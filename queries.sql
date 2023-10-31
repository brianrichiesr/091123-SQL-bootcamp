-- Collect all your queries here if you'd like!


-- 1
SELECT * FROM artists;

-- 2
SELECT * FROM artists WHERE name = "Black Sabbath";

-- 3
CREATE TABLE IF NOT EXISTS fans (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

-- 4
ALTER TABLE fans 
ADD COLUMN artist_id INTEGER;

-- 5
INSERT INTO fans (name, artist_id) 
VALUES ("Isaac", 174);

-- 6
SELECT * 
FROM fans 
JOIN artists 
ON artists.id = fans.artist_id
WHERE artists.name IS NOT "Black Eyed Peas";

-- 7
SELECT artists.name AS artist_name, albums.title AS album_title 
FROM artists 
JOIN albums 
ON artists.id = albums.artist_id 
ORDER BY artists.name;

-- 8
-- Will automatically count by the grouping
SELECT artists.name, albums.title, COUNT() AS track_count 
FROM artists 
JOIN albums 
ON artists.id = albums.artist_id 
JOIN tracks 
ON albums.id = tracks.album_id 
GROUP BY artists.name, albums.title;

-- 9
SELECT DISTINCT artists.name 
FROM artists 
JOIN albums
ON artists.id = albums.artist_id
JOIN tracks
ON albums.id = tracks.album_id
JOIN genres 
ON tracks.genre_id = genres.id
WHERE genres.name = "Pop";

-- 10
SELECT artists.name, COUNT(tracks.album_id) AS track_count
FROM artists 
JOIN albums
ON artists.id = albums.artist_id
JOIN tracks
ON albums.id = tracks.album_id
JOIN genres 
ON tracks.genre_id = genres.id
GROUP BY artists.id
HAVING genres.name = "Rock"
and track_count > 30
ORDER BY track_count DESC;

-- By using COUNT() without any argument, you are counting the number of rows returned by the query for each artist name in the "Rock" genre. So, it automatically counts the number of tracks associated with each artist, and you don't need to specify a specific column inside COUNT() because the count is applied to the entire result set after the GROUP BY clause.