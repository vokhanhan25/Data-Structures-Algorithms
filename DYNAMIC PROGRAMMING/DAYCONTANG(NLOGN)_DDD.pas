const fi='NTSEQ.inp';
      fo='NTSEQ.out';
      maxn=30000;
var n,res:longint;
a,F,T:array [1..maxn] of longint;
procedure docfile;
var i:longint;
begin
    readln (n);
    for i:=1 to n do read (a[i]);
end;

function search(i:longint):longint;
var d,c,k:longint;
begin
    d:=1; c:=res;
    repeat
       k:=(d+c) div 2;
       if a[f[k]]<a[i] then d:=k+1 else c:=k;
    until d>=c;
    exit (c);
end;

procedure xuli;
var i,j,dem:longint;
begin
    F[1]:=1; res:=1; dem:=0;
    for i:=2 to n do
    begin
     if a[i]>a[F[res]] then
     begin
         inc (res);
         F[res]:=i;
     end
     else begin
         j:=search (i);
         F[j]:=i;
     end;
     T[i]:=res;
    end;
     write (res);
end;

begin
    assign (input,fi); reset(input);
    assign (output,fo); rewrite (output);
    docfile;
    xuli;
    close (input); close (output);
end.
