SELECT d.directory_name AS "Directory", 
    u.user_name AS "Username",
    to_timestamp(CAST(attribute_value AS BIGINT)/1000) AS "Last Login" 
FROM cwd_user u
JOIN (
    SELECT DISTINCT child_name
    FROM cwd_membership m
    JOIN licenserolesgroup gp ON m.parent_name = gp.GROUP_ID
    ) AS m ON m.child_name = u.user_name
JOIN (
    SELECT * 
    FROM cwd_user_attributes ca
    WHERE attribute_name = 'login.lastLoginMillis'
    ) AS a ON a.user_id = u.id
JOIN cwd_directory d ON u.directory_id = d.id
ORDER BY "Last Login" DESC;
