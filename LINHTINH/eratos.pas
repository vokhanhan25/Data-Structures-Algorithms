uses math;
const fi='ERATOS.inp';
      fo='ERATOS.out';
      maxn=10000;
var n:longint;
a:array [1..maxn] of longint;
free:array [1..maxn] of boolean;

procedure rf;
begin
    readln (n);
    fillchar (Free,sizeof(Free),true);
end;

procedure eratos;
var i,j:longint;
begin
    for i:=2 to trunc(sqrt(n)) do
     if free[i] then
     begin
         j:=i*i;
         while j<=n do
         begin
             free[j]:=false;
             j:=j+i;
         end;
     end;
end;

procedure wf;
var i:longint;
begin
    for i:=2 to n do
     if free[i] then write (i,' ');
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    rf;
    eratos;
    wf;
    close (input); close (output);
end.

