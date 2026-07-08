--Students at Risk

SELECT
	s.StudentID,
	s.FirstName,
	s.LastName,
	ROUND(AVG(m.Mark), 2) AS AverageMark
	FROM Students s
	JOIN Marks m ON s.StudentID = m.StudentID
	GROUP BY
	s.StudentID,
	s.FirstName,
	s.LastName
	HAVING AVG(m.Mark) < 50;

--Best Lecturer Based on Student Performance

SELECT
	l.FirstName,
	l.LastName,
	ROUND(AVG(m.Mark), 2) AS AverageStudentMark
	FROM Marks m
	JOIN Modules mo ON m.ModuleID = mo.ModuleID
	JOIN Lecturers l ON mo.LecturerID = l.LecturerID
	GROUP BY l.FirstName, l.LastName
	ORDER BY AverageStudentMark DESC;

-- Average Marks by Faculty

SELECT 
	f.FacultyName,
	ROUND(AVG(m.Mark), 2) AS AverageFacultyMark
	FROM Marks m
	JOIN Students s ON m.StudentID = s.StudentID
	JOIN Faculties f ON s.FacultyID = f.FacultyID
	GROUP BY f.FacultyName
	ORDER BY AverageFacultyMark DESC;

-- Most Difficult Modules

SELECT 
	mo.ModuleCode,
	mo.ModuleName,
	ROUND(AVG(ma.Mark), 2) AS AverageMark
	FROM Marks ma
	JOIN Modules mo ON ma.ModuleID = mo.ModuleID
	GROUP BY
	mo.ModuleCode,
	mo.ModuleName
	ORDER BY AverageMark ASC
	LIMIT 10;

-- Pass Rates Per Module

SELECT 
	mo.ModuleCode,
	mo.ModuleName,
	ROUND(SUM(CASE WHEN ma.Mark >= 50 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS PassRate
	FROM Marks ma
	JOIN Modules mo ON ma.ModuleID = mo.ModuleID
	GROUP BY
	mo.ModuleCode,
	mo.ModuleName
	ORDER BY PassRate DESC;

-- Top Performing Students

SELECT 
	s.StudentID,
	s.FirstName,
	s.LastName,
	ROUND(AVG(m.Mark), 2) AS AverageMark
	FROM Students s
	JOIN Marks m ON s.StudentID = m.StudentID
	GROUP BY
	s.StudentID,
	s.FirstName,
	s.LastName
	ORDER BY AverageMark DESC
	LIMIT 10;