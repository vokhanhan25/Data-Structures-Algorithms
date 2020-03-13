Uses math;
Const fi='NKTICK.inp';
      fo='NKTICK.out';

Var n,k:longint;


f:array [0..60001] of int64;
t,r:array [0..60001] of longint;

Procedure docfile;
Var i:longint;
Begin
   Readln (n);
   For i:=1 to n do Read (t[i]);
   For i:=1 to n-1 do Read (r[i]);
End;


Procedure xuli;
Var s,i,m,j,csmax:longint;
Begin
  F[0]:=0; F[1]:=t[1];
  f[2]:=min(f[1]+t[2],r[1]);
  For i:=3 to n do
  F[i] := Min(F[i-1] + T[i], F[i-2] + R[i-1]);
Write (f[n]);
end;


Begin
//  Assign (input,fi); Reset (input);
//  Assign (output,fo); Rewrite (output);
   docfile;
   xuli;
  // Close (input); Close (output);
End.





