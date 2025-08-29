-- HR_DEPARTMENT와 HR_EMPLOYEES 테이블
-- 부서별로 부서 ID, 영문 부서명, 평균 연봉
-- 평균연봉은 소수점 첫째 자리에서 반올림하고 컬럼명은 AVG_SAL
-- 결과는 부서별 평균 연봉을 기준으로 내림차순 정렬

SELECT 
    d.DEPT_ID,
    d.DEPT_NAME_EN,
    ROUND(AVG(e.SAL)) as AVG_SAL
FROM 
    HR_DEPARTMENT d
JOIN 
    HR_EMPLOYEES e ON d.DEPT_ID = e.DEPT_ID
GROUP BY 
    d.DEPT_ID, d.DEPT_NAME_EN
ORDER BY 
    3 DESC;
