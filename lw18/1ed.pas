PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 1 .. NumberOfScores;
  Student: 1 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 1; 
  WHILE Student <= ClassSize
  DO 
    BEGIN
      TotalScore := 0;
      WhichScore := 1;
      WHILE WhichScore <= NumberOfScores
      DO
        BEGIN
          READ(NextScore);
          TotalScore := TotalScore + NextScore;
          WhichScore := WhichScore + 1
        END;
      READLN;
      TotalScore := TotalScore * 100;
      Ave := TotalScore DIV NumberOfScores;
      IF Ave MOD 100 >= 5
      THEN
        WRITE('Ave: ', Ave DIV 100 + 1)
      ELSE
        WRITE('Ave: ', Ave DIV 100);
      ClassTotal := ClassTotal + TotalScore;
      Student := Student + 1;
      WRITELN
    END;
  WRITELN;
  WRITELN ('Class average:');
  ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
  WRITELN(ClassTotal DIV 100, '.',ClassTotal MOD 10:1, ClassTotal MOD 100:1)
END.  {AverageScore}
