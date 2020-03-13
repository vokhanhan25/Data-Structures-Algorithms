Program Xaucon;
Var s,st,st1:ansistring;
    i,j:integer;
    F: Array[1..2000,1..2000] Of Integer;

Procedure nhap;
 Begin
  Readln(s);
  For i:=1 to length(s) do F[i,i]:=1;
  Writeln;Writeln;
 end;

Function max(a,b:integer):integer;
 Begin
  If a>b then exit(a) else exit(b);
 End;


Procedure Solve;
 Begin
  For i:=length(s) downto 1 do
   For j:=i+1 to length(s) do
     If s[i]=s[j] then
         F[i,j]:=F[i+1,j-1]+2
     else F[i,j]:= max(F[i+1,j],F[i,j-1]);
   End;

Procedure PrintResult;
 Begin
  i:=1;
  j:=length(s);
    While (i<=j) do
    Begin
     If s[i]=s[j] then
       Begin
         st:=st+s[i];
         st1:=s[j]+st1;
         inc(i);
         dec(j);
       end
     Else
       If F[i+1,j]=F[i,j] then inc(i) else dec(j);
    End;
     If F[1,length(s)] mod 2 =1 then delete(st1,1,1);
    st:=st+st1;
  Writeln(st);
  end;

 Begin
 nhap;
 Solve;
 PrintResult;
readln
end.
