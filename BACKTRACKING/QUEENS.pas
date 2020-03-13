const fi='QUEENS.inp';
      fo='QUEENS.out';
      maxn=13;
var dem,n:longint;
a:array [1..maxn] of boolean;
b:array [2..2*maxn] of boolean;
c:array [1-maxn..maxn-1] of boolean;
x:array [1..maxn] of longint;
procedure docfile;
var i:longint;
begin
    readln (n);
end;

procedure xuatfile;
var i:longint;
begin
    for i:=1 to n do write (i,' ',x[i],' -- ');
    writeln;
end;

procedure try(i:longint);
var j:longint;
begin
    for j:=1 to n do
     if a[j] and b[i+j] and c[i-j] then
     begin
         x[i]:=j;
         if i=n then xuatfile
         else begin
             a[j]:=false; b[i+j]:=false; c[i-j]:=false;
             try (i+1);
             a[j]:=true; b[i+j]:=true; c[i-j]:=true;
         end;
     end;
end;

begin
    assign (input,fi); reset(input);
    assign (output,fo); rewrite (output);
    docfile;
    Fillchar (a,sizeof(a),true);
    fillchar (b,sizeof(b),true);
    fillchar (c,sizeof(c),true);
    try(1);
    close (input); close (output);
end.
