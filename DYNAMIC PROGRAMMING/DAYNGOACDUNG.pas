Const fi='DAYNGO.inp';
      fo='DAYNGO.out';
Var kq,n:longint;
st,tm,s:string;
//:array [1..100] of char;
Procedure docfile;
Begin
   Readln (n);
   If n=2 then
   Begin
    Writeln ('()');
    Write (1);
    Halt;
   End;
   st:=''; s:='';
   tm[1]:='(';
   tm[2]:=')';
End;

{Procedure xuatfile;
Var i:longint;
Begin
  For i:=1 to n do Write (b[i]);
  Writeln;
  inc (kq);
End;}

Function ktnd(st:string):boolean;
Var tm,d:longint;
Begin
  tm:=0;
   Repeat
    d:=pos('()',st);
    Delete (st,d,2);
    inc(tm);
   Until d=0;
   If (tm-1)*2=n then exit(true);
   exit(false);
End;

Procedure try(i:longint);
Var j,k:longint;
Begin
   For j:=1 to 2 do
   Begin
      insert(tm[j],st,i);
    If i=n then
    Begin
     s:=copy(st,1,n);
      If ktnd(s) then
      Begin
       Writeln(s);
       inc (kq);
      End;
    End
    Else try (i+1);
   End;
End;

Begin
 //  Assign (input,fi); Reset (input);
  // Assign (output,fo); Rewrite (output);
   docfile;
   kq:=0;
   try(1);
   Writeln (kq);
 //  If ktnd('(())()') then Write ('YES') else Write ('NO');
  // Close (input); Close (output);
End.
    