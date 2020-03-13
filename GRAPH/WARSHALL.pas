Const fi='.inp';
      fo='.out';
Var n:longint;
a:array [1..102] of longint;
Procedure docfile;
var i:longint;
begin
    readln (n);
    for i:=1 to n do read (a[i]);
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    docfile;
    close (input); close (output);
end.
