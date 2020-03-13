Const fi ='BIT.inp';
      fo ='BIT.out';

Var n:longint;

function getbit (x,i:longint):longint;
begin
    getbit:=(x shr (i-1)) and 1;
end;

Procedure SetBit(c:byte; k:Word; var x: Word);
Begin
If c = 1 then x := x or (1 shl(k-1))
Else x := x and (not (1 shl (k-1)));
End;

Procedure docfile;
Var i,j:longint;
Begin
    Readln (n);
    for i:=1 to (1 shl n)-1 do
    begin
        for j:=1 to n do
         if getbit(i,j)=1 then write (j);
        writeln;
    end;
end;


Begin
   Assign (input,fi); Reset (input);
   Assign (output,fo); Rewrite (output);
   docfile;
   Close (input); Close (output);
End.


