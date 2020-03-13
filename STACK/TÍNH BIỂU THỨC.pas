Const
  fi ='STACK.inp';
  fo ='STACK.out';
Var st:string;
stack,b,a:array [1..102] of string;
bt:array [1..102] of real;
n:longint;
Procedure docfile;
Var i,j:longint;

Begin
  Readln (st);
End;

Procedure tach;
Var i,j:longint;
Begin
 i:=1; j:=0;
  While i<=length(st) do
  Begin
    If (st[i]<>'+') and (st[i]<>'-') and (st[i]<>'*') and (st[i]<>'/')
    and (st[i]<>'(') and (st[i]<>')') then
     Begin
      inc (j);
      While (st[i]<>'+') and (st[i]<>'-') and (st[i]<>'*') and (st[i]<>'/')
      and (st[i]<>'(') and (st[i]<>')') do
      Begin
       a[j]:=a[j]+st[i];
       inc (i);
     End;

    End
    Else Begin
     inc (j);
     a[j]:=st[i];
     inc (i);
    End;
  End;
 End;

Function sosanh (k:char):longint;
Begin
 case k of
  '(':exit (0);
  '+','-':exit (1);
  '*','/':exit (2);
 End;
End;

Procedure xuli;
Var
i,j,top:longint;  x:string;
q:array [1..102] of string;
Begin
   top:=0; j:=0;
  For i:=1 to length(st) do
  Begin
   Case a[i] of
   '(':begin
   inc (top);
   stack[top]:='(';
        End;
   ')':Repeat
     x:=stack[top];
     dec (top);
     If x<>'(' then
     Begin
      inc (j);
      b[j]:=x;
     End;
   Until x='(';
  '+','-','*','/': Begin
   While (top<>0) and (sosanh(a[i][1])<=sosanh(stack[top][1])) do
   Begin
    inc (j);
    b[j]:=stack[top];
    dec (top);
   End;
   inc (top);
   stack[top]:=a[i];
  End
  Else Begin
   inc (j);
   b[j]:=a[i];
  End;
   End;
  End;
While top<>0 do
Begin
  inc (j);
  b[j]:=stack[top];
  dec (top);
End;
n:=j;
End;

Procedure tinh;
Var top,i,so:longint;
x,y,tm:real;
Begin
  top:=0;
  For i:=1 to n do
   Case b[i] of
   '+','-','*','/':
   Begin
    x:=bt[top]; dec (top);
    y:=bt[top]; dec (top);
    Case b[i] of
     '+':tm:=x+y;
     '-':tm:=y-x;
     '*':tm:=x*y;
     '/':tm:=y/x;
    End;
     inc (top);
     bt[top]:=tm;
    End
    Else Begin
     val(b[i],so);
     inc (top);
     bt[top]:=so;
    End;
   End;
   Write (bt[top]:0:2);
End;


Begin
   Assign (input,fi); Reset (input);
   Assign (output,fo); Rewrite (output);
   docfile;
   tach;
   xuli;
   tinh;
   Close (input); Close (output);
End.


