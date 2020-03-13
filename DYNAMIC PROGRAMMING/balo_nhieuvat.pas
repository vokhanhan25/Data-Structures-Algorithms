Uses math;
Const fi='balo2.inp';
      fo='balo2.out';
Type rec=record
     w,v:longint;
     End;
Var m,n:longint;
a:array [1..10000] of rec;
F:array [0..10000,0..10000] of longint;
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
Var i,tm:longint;
kq:array [1..10000] of longint;
Begin
   i:=0; tm:=n;
   While n<>0 do
   Begin
      If F[n,m]<> F[n-1,m] then
      Begin
       inc (i);
       kq[i]:=1;
       m:=m-a[n].w;
      End
      Else Begin
       inc (i);
       kq[i]:=0;
      End;
      dec (n);
   End;
   For i:=1 to tm do Write (kq[i],' ');
End;

Begin
   Assign (input,fi); Reset (input);
   Assign (output,fo); Rewrite (output);
   docfile;
   xuli;
   truyvet;
   Close (input); Close (output);
End.
