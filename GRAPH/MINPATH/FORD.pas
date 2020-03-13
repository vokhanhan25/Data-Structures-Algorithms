const fi='DIJKSTRA.inp';
      fo='FORD.out';
      maxn=1000;
      maxc=10000000;
var n,m,s,f:longint;
c:array [1..maxn,1..maxn] of longint;
d,trace:array [1..maxn] of longint;
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

procedure ford;
var i,u,v,k:longint; stop:boolean;
begin
    for i:=1 to n do d[i]:=maxc;
    d[s]:=0;
    for i:=1 to n-1 do
    begin
        stop:=true;
        for u:=1 to n do
         for v:=1 to n do
          if d[v]>d[u]+c[u,v] then
          begin
              d[v]:=d[u]+c[u,v];
              trace[v]:=u;
              stop:=false;
          end;
        if stop then exit;
    end;
end;

procedure wf;
begin
    if d[f]=maxc then write (-1)
    else begin
        while f<>s do
        begin
            write (f,' ');
            f:=trace[f];
        end;
        writeln (s);
    end;
end;

begin
    assign (input,fi); reset(input);
    assign (output,fo); rewrite (output);
    rf;
    ford;
    wf;
    close (input); close (output);
end.
