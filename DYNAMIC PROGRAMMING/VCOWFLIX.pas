Uses math;
Const fi='VCOWFLIX.inp';
      fo='VCOWLFIX.out';

Var n,c:longint;

F:array [0..5001] of BOOLEAN;
a:array [1..5001] of longint;

Procedure docfile;
Var i:longint;
Begin
 Readln (c,n);
 For i:=1 to n do Readln (a[i]);
End;


Procedure xuli;
Var s,i,m,j,csmax:longint;
Begin
  F[0] := true;
For i := 1 to n do
For j := C downto a[i] do
F[j] := F[j] or (F[j - a[i]]);
For i := C downto 0 do
if F[i] then
begin
writeln(i);
exit;
end;

end;


Begin
   Assign (input,fi); Reset (input);
  Assign (output,fo); Rewrite (output);
   docfile;
   xuli;
   Close (input); Close (output);
End.





