PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
  EndOfString = ' ';
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 1 .. NumberOfScores;
  Student: 1 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
  Ch: CHAR;
  F: TEXT;
BEGIN {AverageScore}
  ASSIGN(F, 'students.txt');
  RESET(F);
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 1;
  WHILE (Student <= ClassSize) AND (NOT EOF(F))
  DO 
    BEGIN
      Ch := '#';
      WHILE Ch <> EndOfString
      DO
        BEGIN
          READ(F, Ch);
          WRITE(OUTPUT, Ch);
        END; 
      TotalScore := 0;
      WhichScore := 1;
      WHILE WhichScore <= NumberOfScores
      DO
        BEGIN
          READ(F, NextScore);
          TotalScore := TotalScore + NextScore;
          WhichScore := WhichScore + 1
        END;
      READLN(F);
      TotalScore := TotalScore * 100;
      Ave := TotalScore DIV NumberOfScores;
      IF Ave MOD 100 >= 5
      THEN
        WRITELN(OUTPUT, Ave DIV 100 + 1)
      ELSE
        WRITELN(OUTPUT, Ave DIV 100);
      ClassTotal := ClassTotal + TotalScore;
      Student := Student + 1
    END;
  WRITELN;
  WRITELN (OUTPUT, 'Class average:');
  ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
  WRITE(OUTPUT);
  WRITELN(ClassTotal DIV 100, '.', ClassTotal MOD 100:1)
END.  {AverageScore}
