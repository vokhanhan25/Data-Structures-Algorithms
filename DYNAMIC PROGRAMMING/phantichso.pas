const fi='ANALYSE.inp';
      fo='ANALYSE.out';
{dem so cach phan tich}
var n:longint;
F:array [0..102] of longint;
procedure docfile;
var i:longint;
begin
    readln (n);
end;

procedure xuli;
var m,v:longint;
begin
    fillchar (F,sizeof(F),0);
    F[0]:=1;
    for m:=1 to n do
     for v:=m to n do
     F[v]:=F[v]+F[v-m];
    Writeln (F[n],' ');
end;

begin
    assign (input,fi); reset(input);
    assign (output,fo); rewrite (output);
    docfile;
    xuli;
    close (input); close (output);
end.
