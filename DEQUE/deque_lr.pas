const max=1000000;
var n,top:longint;
    a,d,l,r:array[0..max] of longint;
procedure docfile;
var f:text; i:longint;
begin
  assign(f,'deque.inp');
  reset(f);
  readln(f,n);
  for i:=1 to n do read(f,a[i]);
  close(f);
end;
procedure deque;
var i,k:longint;
begin
  d[0]:=0;
  top:=0;
  for i:=1 to n do
  begin
    while (top>0) and (a[d[top]]>a[i]) do
    begin
       r[d[top]]:=i-1;
       dec(top);
    end;
   k:=top;
   while (k>0) and (a[d[k]]=a[i]) do dec(k);
   inc(top);
   d[top]:=i;
   l[i]:=d[k]+1;
   end;
  while top>0 do
  begin
    r[d[top]]:=n;
    dec(top);
  end;
end;
procedure xuat;
var i:longint;
begin
  for i:=1 to n do
  writeln(l[i],' ',i,' ',r[i]);
end;
begin
  docfile;
  deque;
  xuat;
  readln;
end.
