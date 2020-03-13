Const
  fi ='LIQ.inp';
  fo ='LIQ.out';
Var n:longint;
L,T,a:array [0..10002] of longint;
Procedure docfile;
Var i:longint;
Begin
   Readln (n);
   For i:=1 to n do Read (a[i]);
End;

Procedure xuli;
Var jmax,i,j:longint;
Begin
   a[0]:=-maxlongint;
   a[n+1]:=maxlongint;
   L[n+1]:=1;
   For i:=n downto 0 do
   Begin
    jmax:=n+1;
    For j:=i+1 to n+1 do
     If (a[j]>a[i]) and (L[j]>L[jmax]) then jmax:=j;
     L[i]:=L[jmax]+1;
     T[i]:=jmax;
   End;
End;

Procedure xuatfile;
Begin
   Writeln (L[0]-2);
End;

Begin
   Assign (input,fi); Reset (input);
   Assign (output,fo); Rewrite (output);
   docfile;
   xuli;
   xuatfile;
   Close (input); Close (output);
End.



