-- HR_DEPARTMENT, HR_EMPLOYEES, HR_GRADE 테이블에서
-- 2022년도 한해 평가 점수가 가장 높은 사원 정보를 조회
-- 2022년도 평가 점수가 가장 높은 사원들의 점수, 사번, 성명, 직책, 이메일을 조회

SELECT
    SUM(g.SCORE) as SCORE,
    g.EMP_NO,
    e.EMP_NAME,
    e.POSITION,
    e.EMAIL
FROM
    HR_EMPLOYEES e
JOIN
    HR_GRADE g ON e.EMP_NO = g.EMP_NO
WHERE
    g.YEAR = 2022
GROUP BY
    g.EMP_NO
ORDER BY
    1 DESC
LIMIT 1;