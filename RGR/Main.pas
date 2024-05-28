PROGRAM CountWordsRGR(INPUT, OUTPUT);

USES
  WordReader, BinaryTree;

VAR
  InputFile, OutputFile: TEXT;

BEGIN
  Assign(InputFile, 'input.txt');
  Assign(OutputFile, 'output.txt');

  CountWordsFromFile(InputFile);
  Rewrite(OutputFile);
  PrintWordCount(OutputFile)
END.

