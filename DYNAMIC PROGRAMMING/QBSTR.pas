uses math;
Const
  fi ='QBSTR.inp';
  fo ='QBSTR.out';
Var n:longint;
st1,st2:ansistring;
f:array [0..1002,0..1002] of longint;
Procedure docfile;
Begin
  Readln (st1);
  Readln (st2);
End;

Procedure xuli;
var i,j:longint;
Begin
    for i:=0 to length(st1) do f[i,0]:=0;
    for i:=0 to length(st2) do f[0,i]:=0;
    for i:=1 to length(st1) do
     for j:=1 to length(st2) do
      if st1[i]=st2[j] then f[i,j]:=f[i-1,j-1]+1
     else f[i,j]:=max(max(f[i-1,j],f[i,j-1]),f[i-1,j-1]);
     writeln (f[length(st1),length(st2)]);
End;


Begin
  // Assign (input,fi); Reset (input);
  // Assign (output,fo); Rewrite (output);
   docfile;
   xuli;
  // Close (input); Close (output);
End.



