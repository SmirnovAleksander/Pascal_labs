PROGRAM CountWordsRGR(INPUT, OUTPUT);

USES
  WordReader, BinaryTree;

VAR
  InputFile, OutputFile: TEXT;

BEGIN
  ASSIGN(InputFile, 'input.txt');
  ASSIGN(OutputFile, 'output.txt');

  CountWordsFromFile(InputFile);
  Rewrite(OutputFile);
  PrintTree(OutputFile)
END.

