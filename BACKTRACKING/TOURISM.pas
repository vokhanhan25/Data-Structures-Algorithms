Const fi='TOURISM.inp';
      fo='TOURISM.out';
      maxc=100000;
Type rec=record
     x,y,c:longint;
     end;
Var n,m,kq:longint;
c:array [1..102,1..102] of longint;
x,T,b:array [1..103] of longint;
Free:array [1..102] of boolean;
Procedure docfile;
Var i,j,u,v,k:longint;
Begin
  Readln (n,m);
  for u:=1 to n do
   for v:=1 to n do
    if u=v then c[u,v]:=0
    else c[u,v]:=maxc;
  for i:=1 to m do
  begin
      readln (u,v,c[u,v]);
      c[v,u]:=c[u,v];
  end;

End;

Procedure khoitao;
Begin
  Fillchar (Free,n,true);
  Free[1]:=false;
  x[1]:=1; T[1]:=0;
  kq:=maxc;
End;

Procedure try(i:longint);
Var j:longint;
Begin
   For j:=2 to n do
    If free[j] then
    Begin
     x[i]:=j;
     T[i]:=T[i-1]+C[x[i-1],j];
     If T[i]<kq then
      If i<n then
     Begin
      Free[j]:=false;
      Try(i+1);
      Free[j]:=true;
     End
     Else If T[n]+C[x[n],1]<kq then
     Begin
       For i:=1 to n do b[i]:=x[i];
       kq:=T[n]+C[x[n],1];
     End;
    End;
End;


Procedure xuatfile;
Var i:longint;
Begin
  If kq=maxc then Write (-1)
  Else Begin
   Writeln (kq);
   For i:=1 to n do Write (b[i],' ');
   Writeln (1);
  End;
End;

Begin
   Assign (input,fi); Reset (input);
   Assign (output,fo); Rewrite (output);
   docfile;
   khoitao;
   try(2);
   xuatfile;
   Close (input); Close (output);
End.
