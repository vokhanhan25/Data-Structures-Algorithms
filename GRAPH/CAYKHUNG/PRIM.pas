Const fi ='KRUSKAL.inp';
      fo ='PRIM.out';
      maxc=1000000;

Var n,m:longint;
c:array [1..10000,1..10000] of longint;
trace,d:array [1..10000] of longint;
free:array [1..10000] of boolean;

Procedure docfile;
Var i,u,v:longint;
Begin
  Readln (n,m);
  for u:=1 to n do
   for v:=1 to n do
    if u=v then c[u,v]:=0 else c[u,v]:=maxc;
  for i:=1 to m do
  begin
      readln (u,v,c[u,v]);
      c[v,u]:=c[u,v];
  end;
end;

procedure prim;
var i,k,u,v,min:longint;
begin
    for i:=1 to n do d[i]:=maxc;
    d[1]:=0;
    fillchar (free,sizeof(free),true);
    for k:=1 to n do
    begin
        u:=0; min:=maxc;
        for i:=1 to n do
         if free[i] and (d[i]<min) then
         begin
             u:=i;
             min:=d[i];
         end;
        if u=0 then
        begin
            write (-1);
            halt;
        end;
        free[u]:=false;
        for v:=1 to n do
         if free[v] and (c[u,v]<d[v]) then
         begin
             d[v]:=c[u,v];
             trace[v]:=u;
         end;
    end;
end;

procedure xuatfile;
var kq,v:longint;
begin
    kq:=0;
    for v:=2 to n do
    begin
        writeln (trace[v],' ',v,' ',c[trace[v],v]);
        kq:=kq+c[trace[v],v];
    end;
    writeln (kq);
end;

Begin
   Assign (input,fi); Reset (input);
   Assign (output,fo); Rewrite (output);
   docfile;
   prim;
   xuatfile;
   Close (input); Close (output);
End.


