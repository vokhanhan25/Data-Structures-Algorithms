Const fi='HE2.inp';
      fo='HE2.out';
Var st:string;
n,x,k,a,b:longint;

Procedure docfile;
Begin
  Readln (St);
  Readln (n);
  Readln (x,k);
  Readln (a,b);
End;

Function h2h10(st:string):longint;
Var i,s,so:longint;
Begin
   s:=0;
   For i:=1 to length(st) do
   Begin
      so:=ord(st[i])-48;
      s:=s+so*(1 shl (length(st)-i));
   End;
   Exit (s);
End;

Function h10h2(n:longint):string;
Var du:longint;
st:string;
Begin
  st:='';
  While n>=1 do
  Begin
   du:=n mod 2;
   st:=chr(du+48)+st;
   n:=n div 2;
  End;
  Exit (st);
End;

Function LUTH (x,n:longint):longint;
Var kq:longint;
Begin
   If n=0 then exit (1);
   kq:=luth(x,n div 2);
   kq:=(kq*kq);// mod 10000;
   If n mod 2=1 then kq:=(kq*x); //mod 10000;
   Exit (kq);
End;

Function UCLN (a,b:longint):longint;
Var du:longint;
Begin
   While a mod b <>0 do
   Begin
     du:=a mod b;
     a:=b;
     b:=du;
     a:=a-b;
   End;
   Exit (b);
End;

Begin
   Assign (input,fi); Reset (input);
   Assign (output,fo); Rewrite (output);
   docfile;
   Writeln (h2h10(st));
   Writeln (h10h2(n));
   Writeln (luth(x,k));
   Writeln (UCLN(a,b));
   Close (input); Close (output);
End.
