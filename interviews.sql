/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
SELECT
    C.CONTEST_ID, C.HACKER_ID, C.NAME,
    SUM(B.TOTAL_SUBMISSIONS), SUM(B.TOTAL_ACCEPTED_SUBMISSIONS),
    SUM(B.TOTAL_VIEWS), SUM(B.TOTAL_UNIQUE_VIEWS)
FROM
    CONTESTS C
    INNER JOIN COLLEGES G ON C.CONTEST_ID = G.CONTEST_ID
    INNER JOIN CHALLENGES CH ON G.COLLEGE_ID = CH.COLLEGE_ID
    INNER JOIN
    (
        SELECT CH1.COLLEGE_ID, A.CHALLENGE_ID, SUM(TOTAL_VIEWS) AS TOTAL_VIEWS, SUM(TOTAL_UNIQUE_VIEWS) AS TOTAL_UNIQUE_VIEWS, SUM(TOTAL_SUBMISSIONS) AS TOTAL_SUBMISSIONS, SUM(TOTAL_ACCEPTED_SUBMISSIONS) AS TOTAL_ACCEPTED_SUBMISSIONS
    FROM
        (
                        SELECT CHALLENGE_ID, SUM(TOTAL_VIEWS) AS TOTAL_VIEWS, SUM(TOTAL_UNIQUE_VIEWS) AS TOTAL_UNIQUE_VIEWS, 0 AS TOTAL_SUBMISSIONS, 0 AS TOTAL_ACCEPTED_SUBMISSIONS
            FROM VIEW_STATS
            GROUP BY CHALLENGE_ID
        UNION ALL
            SELECT CHALLENGE_ID, 0 AS TOTAL_VIEWS, 0 AS TOTAL_UNIQUE_VIEWS, SUM(TOTAL_SUBMISSIONS) AS TOTAL_SUBMISSIONS, SUM(TOTAL_ACCEPTED_SUBMISSIONS) AS TOTAL_ACCEPTED_SUBMISSIONS
            FROM SUBMISSION_STATS
            GROUP BY CHALLENGE_ID 
        ) A
        INNER JOIN CHALLENGES CH1 ON A.CHALLENGE_ID = CH1.CHALLENGE_ID
    GROUP BY CH1.COLLEGE_ID, A.CHALLENGE_ID
    HAVING SUM(TOTAL_VIEWS) <> 0 OR SUM(TOTAL_UNIQUE_VIEWS) <> 0 OR SUM(TOTAL_SUBMISSIONS) <> 0 OR SUM(TOTAL_ACCEPTED_SUBMISSIONS) <> 0
    ) B ON CH.CHALLENGE_ID = B.CHALLENGE_ID
GROUP BY 
    C.CONTEST_ID, C.HACKER_ID, C.NAME