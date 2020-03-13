const  max=101;
  fi='capghep.inp' ;
  fo='capghep.out';
var
  c:array[1..max,1..max] of integer;
  t,a,b:array[1..max]of integer;
   m,n,lj,scg:integer;
   ok:boolean;

procedure docfile;
var i,j:integer;
    f:text;
begin
  assign(f,fi);
  reset(f);
  readln(f,n,m);
  fillchar(c,sizeof(c),0);
  scg:=0;
  while not eof(f) do
   begin
     readln(f,i,j);
     c[i,j]:=1;
   end;
  close(f);
end;


procedure init;
begin
  fillchar(a,sizeof(a),0);
  fillchar(b,sizeof(b),0);
end;
procedure tangcanh(j:integer);
var i,p:integer;
begin
  inc(scg);
  repeat
    i:=t[j];
    p:=a[i];
    a[i]:=j;
    b[j]:=i;
    j:=p;
  until j=0;
end;
procedure timduong(i:byte);
 var j:integer;
     q:array[1..100]of integer;
     dau,cuoi:integer;
begin
  fillchar(t,sizeof(t),0);
  dau:=1;
  cuoi:=1;
  q[cuoi]:=i;
  repeat
    i:=q[dau]; inc(dau);
    for j:=1 to m do
      if (t[j]=0) and (c[i,j]=1) then
         begin
            t[j]:=i;
            if b[j]=0 then
              begin
                 tangcanh(j);
                 exit;
              end
              else
              begin
                inc(cuoi);
                q[cuoi]:=b[j];
              end;
         end;
  until dau>cuoi;
end;
procedure thuchien;
var i:integer;
begin
  for i:=1 to n do
    if a[i]=0 then timduong(i);
end;
procedure ghifile;
var f:text;
   i:byte;
begin
   assign(f,fo);
   rewrite(f);
   writeln(f,scg);
   for i:=1 to n do
     if a[i]<>0 then writeln(f,i,' ',a[i]);
    close(f);
end;
BEGIN
  init;
  docfile;
  thuchien;
  ghifile;
END.
