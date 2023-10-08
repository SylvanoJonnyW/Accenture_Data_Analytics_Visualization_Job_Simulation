SELECT
	r.Datetime,
	c.ContentID,
    c.Type AS ContentType,
    c.Category,
    rt.Type AS Reaction,
    rt.Score,
    c.URL
FROM content c
	INNER JOIN reaction r
		ON r.ContentID = c.ContentID
	INNER JOIN reaction_type rt
		ON rt.Type = r.Type;
        
CREATE TABLE merge_table (
    Datetime DATETIME,
    ContentID VARCHAR(255),
    ContentType VARCHAR(255),
    Category VARCHAR(255),
    Reaction VARCHAR(255),
    Score INT,
    URL VARCHAR(255)
);


INSERT INTO merge_table (Datetime, ContentID, ContentType, Category, Reaction, Score, URL)
SELECT
    r.Datetime,
    c.ContentID,
    c.Type AS ContentType,
    c.Category,
    rt.Type AS Reaction,
    rt.Score,
    c.URL
FROM content c
    INNER JOIN reaction r
        ON r.ContentID = c.ContentID
    INNER JOIN reaction_type rt
        ON rt.Type = r.Type;
        

SELECT * FROM merge_table;

SELECT 
	Category,
    SUM(Score) AS Total_Score
FROM merge_table
GROUP BY Category
ORDER BY Total_Score DESC
LIMIT 5;