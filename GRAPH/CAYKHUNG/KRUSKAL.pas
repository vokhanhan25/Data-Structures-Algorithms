Const fi='KRUSKAL.inp';
      fo='KRUSKAL.out';
Type rec=record
     x,y,c:longint;
     End;
Var kq,a:array [1..150001] of rec;
cha:array [1..150001] of longint;
s,sl,n,m:longint;

Procedure sort (d,c:longint);
Var i,j:longint; tm,k:rec;
Begin
   i:=d; j:=c;
   k:=a[d+random(c-d+1)];
   Repeat
    While a[i].c<k.c do inc (i);
    While a[j].c>k.c do dec (j);
    If i<=j then
    Begin
     tm:=a[i];
     a[i]:=a[j];
     a[j]:=tm;
     inc (i);
     dec (j);
    End;
   Until i>j;
   If d<j then sort (d,j);
   If i<c then sort (i,c);
End;

Procedure docfile;
Var i:longint;
Begin
   Readln (n,m);
   For i:=1 to m do
    With a[i] do Readln (x,y,c);
End;

Function timcha(x:longint):longint;
Var i:longint;
Begin
   i:=x;
   While cha[i]>0 do i:=cha[i];
   Exit (i);
End;

Procedure hopnhat(r1,r2:longint);
Var x:longint;
Begin
  x:=cha[r1]+cha[r2];
  If abs(cha[r1])>abs(cha[r2]) then
  Begin
     cha[r2]:=r1;
     cha[r1]:=x;
  End
  Else Begin
   cha[r1]:=r2;
   cha[r2]:=x;
  End;
End;

Procedure kruskal;
Var i,x,y,r1,r2:longint;
Begin
   s:=0;
   sl:=0;
   For i:=1 to n do cha[i]:=-1;
   For i:=1 to m do
   Begin
    If sl=n-1 then exit;
    x:=a[i].x;
    y:=a[i].y;
    r1:=timcha(x);
    r2:=timcha(y);
    If r1<>r2 then
    Begin
      hopnhat (r1,r2);
      //Writeln (x,' ',y);
      inc (sl);
      kq[sl].x:=x;
      kq[sl].y:=y;
      kq[sl].c:=a[i].c;
      s:=s+a[i].c;
    End;
   End;
End;

Procedure xuatfile;
Var i:longint;
Begin
//Writeln (sl);  {so luong canh tren ck nho nhat}
 Writeln (s);  {tong trong so tren ck nho nhat}
 For i:=1 to n-1 do
 Begin
  Writeln (kq[i].x,' ',kq[i].y,' ',kq[i].c);//,kq[i].c);
End;

End;

Begin
   Assign (input,fi); Reset (input);
   Assign (output,fo); Rewrite (output);
   docfile;
   sort (1,m);
   kruskal;
   xuatfile;
   Close (input); Close (output);
End.

