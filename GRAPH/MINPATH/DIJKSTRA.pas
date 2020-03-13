Const fi='DIJKSTRA.inp';
      fo='DIJKSTRA.out';
      maxc=10000000;
      maxn=10000;
Type rec=record
     x,y,c:longint;
     end;
Var n,m,s,f:longint;
c:Array [1..maxn,1..maxn] of longint;
trace,d:array [1..maxn] of longint;
free:array [1..maxn] of boolean;

Procedure rf;
Var u,v,i,k:longint;
Begin
    readln (n,m,s,f);
    for u:=1 to n do
     for v:=1 to n do
      if u=v then c[u,v]:=0 else c[u,v]:=maxc;
    for i:=1 to m do
    begin
        readln (u,v,c[u,v]);
        c[v,u]:=c[u,v];
    end;
end;

Procedure dijkstra;
Var u,v,i,min,k:longint;
Begin
    for i:=1 to n do
    begin
        d[i]:=maxc;
        free[i]:=true;
    end;
    d[s]:=0;
    repeat
      u:=0; min:=maxc;
      For i:=1 to n do
       If Free[i] and (d[i]<min) then
       Begin
           min:=d[i];
           u:=i;
       End;
       If (u=0) or (u=f) then Break;
       Free[u]:=false;
       For v:=1 to n do
        If free[v] and (d[u]+c[u,v]<d[v]) then
        Begin
            d[v]:=d[u]+c[u,v];
            Trace[v]:=u;
        End;
    until false;
End;

Procedure wf;
Var kq:longint;
Begin
    kq:=d[f];
    If d[f]=maxc then Write (-1)
    Else Begin
        While f<>s do
        Begin
            Write (f,' ');
            f:=trace[f];
        End;
        Writeln (s);
    End;
    Write (kq);
End;

begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
  rf;
  dijkstra;
  wf;
  close(input);close(output);
end.
