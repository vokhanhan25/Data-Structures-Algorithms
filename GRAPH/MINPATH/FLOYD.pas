const fi='DIJKSTRA.inp';
      fo='FLOYD.out';
      maxn=100;
      maxc=10000000;
var n,m,s,f:longint;
c,trace:array [1..maxn,1..maxn] of longint;

procedure rf;
var u,v,i:longint;
begin
    readln (n,m,s,f);
    for u:=1 to n do
     for v:=1 to n do
      if u=v then c[u,v]:=0 else c[u,v]:=maxc;
    for i:=1 to m do
     readln (u,v,c[u,v]);
end;

procedure floyd;
var u,v,k:longint;
begin
    for u:=1 to n do
     for v:=1 to n do trace[u,v]:=v;

    for k:=1 to n do
     for u:=1 to n do
      for v:=1 to n do
       if c[u,v]>c[u,k]+c[k,v] then
       begin
           c[u,v]:=c[u,k]+c[k,v];
           trace[u,v]:=trace[u,k];
       end;
end;

procedure wf;
begin
    if c[s,f]=maxc then write (-1)
    else begin
        writeln (c[s,f]);
        repeat
            write (s,' ');
            s:=trace[s,f];
        until s=f;
    end;
end;

begin
    assign (input,fi); reset(input);
    assign (output,fo); rewrite (output);
    rf;
    floyd;
    wf;
    close (input); close (output);
end.
