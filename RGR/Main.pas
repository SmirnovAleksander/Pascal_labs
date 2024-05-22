PROGRAM CountWordsRGR(INPUT, OUTPUT);

USES
  WordReader, BinaryTree;

VAR
  InputFile, OutputFile: TEXT;
  Root: Tree;

BEGIN
  Assign(InputFile, 'input.txt');
  Assign(OutputFile, 'output.txt');

  Root := NIL;
  CountWordsFromFile(InputFile, Root);

  Rewrite(OutputFile);
  PrintWordCount(Root, OutputFile) 
END.

