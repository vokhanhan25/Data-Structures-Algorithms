uses math;
const fi='MAXFLOW.inp';
      fo='MAXFLOW.out';
      maxn=1001;
      maxc=10000000;
var n,m,s,t:longint;
c,f:array [1..maxn,1..maxn] of longint;
trace:array [1..maxn] of longint;
procedure rf;
var i,u,v:longint;
begin
    readln (n,m,s,t);
    for i:=1 to m do
     readln (u,v,c[u,v]);
end;

function findpath:boolean;
var u,v,i,first,last:longint;
q:array [1..1000000] of longint;
begin
    fillchar (trace,sizeof(trace),0);
    first:=1; last:=1;
    q[1]:=s;
    trace[s]:=n+1; {s tham roi}
    repeat
       u:=q[first]; inc (first);
       for v:=1 to n do
        if (trace[v]=0) and (c[u,v]>f[u,v]) then
        begin
            inc (last); q[last]:=v;
            trace[v]:=u;
            if v=t then exit (true);
        end;
    until first>last;
    exit (false);
end;

procedure incflow; //tang luong doc theo duong tang luong: f=f+fp
var delta,u,v:longint;
begin
    delta:=maxc;
    v:=t;
    repeat
       u:=trace[v];
       delta:=min(delta,c[u,v]-f[u,v]);
       v:=u;
    until v=s;

    v:=t;
    repeat
       u:=trace[v];
       f[u,v]:=f[u,v]+delta;
       f[v,u]:=f[v,u]-delta;
       v:=u;
    until v=s;
end;

procedure pr;
begin
    repeat
       if not findpath then break;
       incflow;
    until false;
end;

procedure wf;
var u,v,res:longint;
begin
    res:=0;
    for u:=1 to n do
     for v:=1 to n do
      if f[u,v]>0 then //chi quan tam nhung cung co luong duong
      begin
         // writeln (u,' ',v,' ',f[u,v]);
          if u=s then res:=res+f[s,v];
      end;
    write (res);
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    rf;
    pr;
    wf;
    close (input); close (output);
end.


