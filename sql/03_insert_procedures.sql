DELIMITER $$

CREATE PROCEDURE insert_hospital(
    IN p_name VARCHAR(100),
    IN p_address VARCHAR(200),
    IN p_phone VARCHAR(20)
)
BEGIN
    INSERT INTO Hospital (name, address, phone)
    VALUES (p_name, p_address, p_phone);
END$$

CREATE PROCEDURE insert_candidate(
    IN p_first_name VARCHAR(50),
    IN p_surname VARCHAR(50),
    IN p_address VARCHAR(200),
    IN p_phone VARCHAR(20),
    IN p_email VARCHAR(100)
)
BEGIN
    INSERT INTO Candidate (first_name, surname, address, phone, email)
    VALUES (p_first_name, p_surname, p_address, p_phone, p_email);
END$$

CREATE PROCEDURE insert_skill(
    IN p_skill_name VARCHAR(50)
)
BEGIN
    INSERT INTO Skill (skill_name)
    VALUES (p_skill_name);
END$$

CREATE PROCEDURE insert_jobposition(
    IN p_position_type VARCHAR(50),
    IN p_hospital_id INT
)
BEGIN
    INSERT INTO JobPosition (position_type, hospital_id)
    VALUES (p_position_type, p_hospital_id);
END$$

CREATE PROCEDURE insert_candidate_skill(
    IN p_candidate_id INT,
    IN p_skill_id INT
)
BEGIN
    INSERT INTO Candidate_Skill (candidate_id, skill_id)
    VALUES (p_candidate_id, p_skill_id);
END$$

CREATE PROCEDURE insert_position_skill(
    IN p_position_id INT,
    IN p_skill_id INT
)
BEGIN
    INSERT INTO Position_Skill (position_id, skill_id)
    VALUES (p_position_id, p_skill_id);
END$$

CREATE PROCEDURE insert_interview(
    IN p_position_id INT,
    IN p_candidate_id INT,
    IN p_interview_date DATE,
    IN p_interview_time TIME,
    IN p_offer_made BOOLEAN
)
BEGIN
    INSERT INTO Interview (position_id, candidate_id, interview_date, interview_time, offer_made)
    VALUES (p_position_id, p_candidate_id, p_interview_date, p_interview_time, p_offer_made);
END$$

DELIMITER ;