CREATE TABLE Faculties(
	FacultyID INT PRIMARY KEY,
	FacultyName VARCHAR(100)
);

CREATE TABLE Students(
	StudentID INT PRIMARY KEY,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	Gender VARCHAR(10),
	FacultyID INT,
	YearLevel INT,
	FOREIGN KEY (FacultyID) REFERENCES Faculties(FacultyID)
);

CREATE TABLE Lecturers(
	LecturerID INT PRIMARY KEY,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	FacultyID INT,
	FOREIGN KEY (FacultyID) REFERENCES Faculties(FacultyID)
);

CREATE TABLE Modules(
	ModuleID INT PRIMARY KEY,
	ModuleCode VARCHAR(20),
	ModuleName VARCHAR(100),
	FacultyID INT,
	LecturerID INT,
	FOREIGN KEY (FacultyID) REFERENCES Faculties(FacultyID),
	FOREIGN KEY (LecturerID) REFERENCES Lecturers(LecturerID)
);

CREATE TABLE Marks(
	MarkID INT PRIMARY KEY,
	StudentID INT,
	ModuleID INT,
	Mark DECIMAL(5,2),
	Semester INT,
	FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
	FOREIGN KEY (ModuleID) REFERENCES Modules(ModuleID)
);




