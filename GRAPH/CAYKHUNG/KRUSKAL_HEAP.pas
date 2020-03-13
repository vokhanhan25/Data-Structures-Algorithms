Const fi='KRUSKAL.inp';
      fo='KRUSKAL_HEAP.out';
Type rec=record
     x,y,c:longint;
     End;
Var kq,a:array [1..150001] of rec;
cha:array [1..150001] of longint;
s,sl,n,m:longint;

Procedure swap(var a,b:rec);
Var tm:rec;
Begin
    tm:=a;
    a:=b;
    b:=tm;
End;

Procedure downheap(i:longint);
Var j:longint;
begin
    j:=i*2;
    if j>m then exit;
    if(j<m) and (a[j].c>a[j+1].c) then inc (j);
    if a[i].c>a[j].c then
    begin
        swap(a[i],a[j]);
        downheap(j);
    end;
end;

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
Var i,x,y,r1,r2:longint; tm:rec;
Begin
     s:=0; sl:=0;
     For i:=1 to n do cha[i]:=-1;
     For i:=m div 2 downto 1 do downheap(i);
     Repeat
      tm:=a[1]; a[1]:=a[m];
      dec(m);  downheap(1);
      If sl=n-1 then exit;
      r1:=timcha(tm.x);
      r2:=timcha(tm.y);
      If r1<>r2 then
      Begin
          hopnhat (r1,r2);
          inc (sl);
          kq[sl].x:=tm.x;
          kq[sl].y:=tm.y;
          kq[sl].c:=tm.c;
          s:=s+tm.c;
      End;
    Until m=0;
End;

Procedure xuatfile;
Var i:longint;
Begin
//Writeln (sl);
 Writeln (s);
 For i:=1 to n-1 do
 Begin
  Writeln (kq[i].x,' ',kq[i].y,' ',kq[i].c);//,kq[i].c);
End;

End;

Begin
   Assign (input,fi); Reset (input);
   Assign (output,fo); Rewrite (output);
   docfile;
   kruskal;
   xuatfile;
   Close (input); Close (output);
End.

