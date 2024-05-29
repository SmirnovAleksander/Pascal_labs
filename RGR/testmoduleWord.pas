program main;

uses
  WordReader;

var
  InputFileHandle, OutputFileHandle: text;
  Word: string;
  WordLength: integer;

begin
  assign(InputFileHandle, 'input.txt');
  reset(InputFileHandle);

  assign(OutputFileHandle, 'output.txt');
  rewrite(OutputFileHandle);

  while not eof(InputFileHandle) do
  begin
    ReadWordsFromFile(InputFileHandle, Word, WordLength);
    if WordLength > 0 then
      writeln(OutputFileHandle, Word);
  end;

  close(InputFileHandle);
  close(OutputFileHandle);
end.

