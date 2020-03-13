Const fi='BINAS.inp';
      fo='BINAS.out';
Var n:longint;
a:array [1..21] of longint;
Procedure docfile;
Begin
   Readln (n);
End;

Procedure xuli;
Var i:longint;
Begin
    For i:=1 to n do a[i]:=0;
    Repeat
      For i:=1 to n do Write (a[i]);
      Writeln;
      i:=n;
      While (i>0) and (a[i]=1) do dec (i);
      If i>0 then
      Begin
        a[i]:=1;
      //  For i:=1 to n do
         Fillchar (a[i+1],(n-i)*sizeof(a[1]),0);
      End;
    Until i=0;
End;

Begin
  // Assign (input,fi); Reset (input);
  // Assign (output,fo); Rewrite (output);
   docfile;
   xuli;
//   Close (input); Close (output);
End.