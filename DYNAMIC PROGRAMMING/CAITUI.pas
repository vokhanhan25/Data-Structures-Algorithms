Uses math;
Const fi='CAITUI.inp';
      fo='CAITUI.out';
Type rec=record
     w,v:longint;
     End;
Var m,n:longint;
a:array [1..100] of rec;
F:array [0..100,0..100] of longint;
Procedure docfile;
Var i:longint;
Begin
   Readln (n,m);
   For i:=1 to n do
    With a[i] do Readln (w,v);

End;

Procedure xuli;
Var i,j:longint;
Begin
    For j:=0 to m do F[0,j]:=0;
    For i:=1 to n do
     For j:=0 to m do
     Begin
      F[i,j]:=F[i-1,j];
      If( j>=a[i].w ) then
      F[i,j]:=max(F[i,j],F[i-1,j-a[i].w]+a[i].v);
     End;
     Writeln (F[n,m]);
End;

Procedure truyvet;
Begin
   While n<>0 do
   Begin
      If F[n,m]<> F[n-1,m] then
      Begin
       Write (n,' ');
       m:=m-a[n].w;
      End;
      dec (n);
   End;
End;

Begin
  // Assign (input,fi); Reset (input);
  // Assign (output,fo); Rewrite (output);
   docfile;
   xuli;
   truyvet;
  // Close (input); Close (output);
End.

