PROGRAM WordFrequency;

USES
  WordReader, BinaryTree;

VAR
  InputFile, OutputFile: TEXT;
  Root: Tree;

BEGIN
  Assign(InputFile, 'input3.txt');
  Assign(OutputFile, 'output3.txt');

  Root := NIL;
  CountWordsFromFile(InputFile, Root);

  Rewrite(OutputFile);
  PrintWordCount(Root, OutputFile);
  Close(OutputFile);    
END.

