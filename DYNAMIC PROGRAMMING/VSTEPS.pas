const fi='VSTEPS.inp';
      fo='VSTEPS.out';
var n,k:longint;
F:array [0..100002] of longint;
free:array [0..100002] of boolean;
procedure docfile;
var i,j:longint;
begin
     fillchar (free,sizeof(free),true);
    readln (n,k);
    for i:=1 to k do
begin
    read (j);
free[j]:=false;
end;
end;

procedure xuli;
var i:longint;
begin
    if free[n] then f[n]:=1 else exit;
   for i:=n-1 downto 1 do
    if not free[i] then f[i]:=0
else f[i]:=(f[i+1]+f[i+2]) mod 14062008;
end;

begin
    assign (input,fi); reset(input);
    assign (output,fo); rewrite (output);
    docfile;
    xuli;
WRITE (F[1]);
    close (input); close (output);
end.
