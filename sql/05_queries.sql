DELIMITER $$

CREATE PROCEDURE Q1_FindHospitalsByID(
    IN p_hospital_id INT
)
BEGIN
    SELECT * FROM Hospital 
    WHERE hospital_id = p_hospital_id;
END$$


CREATE PROCEDURE Q2_FindHospitalsByName(
    IN p_name VARCHAR(100)
)
BEGIN
    SELECT *
    FROM Hospital
    WHERE name = p_name;
END$$


CREATE PROCEDURE Q3_FindCandidatesBySurname(
    IN p_surname VARCHAR(50)
)
BEGIN
    SELECT * FROM Candidate 
    WHERE surname = p_surname;
END$$


CREATE PROCEDURE Q4_FindCandidatesWithSkillMatchingPosition(
    IN p_position_id INT
)
BEGIN
    SELECT DISTINCT C.candidate_id, C.first_name, C.surname
    FROM Candidate C, Candidate_Skill CS, Position_Skill PS
    WHERE C.candidate_id = CS.candidate_id
    AND CS.skill_id = PS.skill_id
    AND PS.position_id = p_position_id;
END$$


CREATE PROCEDURE Q5_CountCandidatesWithOffers()
BEGIN
    SELECT COUNT(DISTINCT candidate_id) AS num_offers
    FROM Interview 
    WHERE offer_made = TRUE;
END$$


CREATE PROCEDURE Q6_FindPositionsRequiringSkill(
    IN p_skill_name VARCHAR(50)
)
BEGIN
    SELECT JP.position_id, JP.position_type, JP.hospital_id
    FROM JobPosition JP, Position_Skill PS, Skill S
    WHERE JP.position_id = PS.position_id
    AND PS.skill_id = S.skill_id
    AND S.skill_name = p_skill_name;
END$$


CREATE PROCEDURE Q7_CountPositionsRequiringNursing()
BEGIN
    SELECT COUNT(*) AS num_requiringNursing
    FROM JobPosition JP, Position_Skill PS, Skill S
    WHERE JP.position_id = PS.position_id
    AND PS.skill_id = S.skill_id
    AND S.skill_name = 'Nursing';
END$$


CREATE PROCEDURE Q8_FindAdvertisedPositionsPerHospital()
BEGIN
    SELECT JP.*, H.name AS Hospital
    FROM JobPosition JP, Hospital H
    WHERE JP.hospital_id = H.hospital_id
    ORDER BY H.name, JP.position_type;
END$$


CREATE PROCEDURE Q9_FindInterviewsByDate(
    IN p_interview_date DATE
)
BEGIN
    SELECT I.interview_id, I.position_id, I.candidate_id, 
           I.interview_date, I.interview_time, I.offer_made,
           C.first_name, C.surname, JP.position_type
    FROM Interview I, Candidate C, JobPosition JP
    WHERE I.candidate_id = C.candidate_id
    AND I.position_id = JP.position_id
    AND I.interview_date = p_interview_date;
END$$


CREATE PROCEDURE Q10_FindCandidatesInterviewedOnlyOnDate(
    IN p_interview_date DATE
)
BEGIN
    SELECT C.candidate_id, C.first_name, C.surname
    FROM Candidate C, Interview I
    WHERE C.candidate_id = I.candidate_id
    AND I.interview_date = p_interview_date
    AND C.candidate_id NOT IN (
        SELECT candidate_id 
        FROM Interview 
        WHERE interview_date != p_interview_date
    );
END$$


CREATE PROCEDURE Q11_FindCandidatesWithMultipleInterviews()
BEGIN
    SELECT C.candidate_id, C.first_name, C.surname, COUNT(*) AS num_interviews
    FROM Candidate C, Interview I
    WHERE C.candidate_id = I.candidate_id
    GROUP BY C.candidate_id, C.first_name, C.surname
    HAVING COUNT(*) > 1;
END$$

DELIMITER ;