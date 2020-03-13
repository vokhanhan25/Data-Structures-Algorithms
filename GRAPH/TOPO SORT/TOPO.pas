Const
  fi ='TOPO.inp';
  fo ='TOPO.out';
  maxn=10000;
  maxm=10000;
  maxc=-10000000;
Type rec=record
     x,y,c:longint;
     End;

Var n,m,s,top:longint;
h,adj,adv:array [0..maxm*2] of longint;
stack,d,trace:array [1..maxn] of longint;
e:array [0..maxm] of rec;
free:array [1..maxn] of boolean;
Procedure docfile;
Var i,j,u,v,k,c:longint;
Begin
    Readln (n,m,s);
    For i:=1 to m do
    Begin
        Readln (u,v,c);
        e[i].x:=u; inc (h[u]);
        e[i].y:=v; //inc (h[v]);
        e[i].c:=c;
    End;
    For i:=2 to n do h[i]:=h[i-1]+h[i];
    k:=h[n];
    For i:=1 to m do
    Begin
        u:=e[i].x; v:=e[i].y;
        adj[h[u]]:=v; adv[h[u]]:=e[i].c; dec(h[u]);
       // adj[h[v]]:=u; adv[h[v]]:=e[i].c; dec(h[v]);
    End;
    h[n+1]:=k;
End;

procedure visit (u:longint);
var v,k:longint;
begin
    free[u]:=false;
    for k:=h[u]+1 to h[u+1] do
    begin
        v:=adj[k];
        if free[v] then visit (v);
    end;
    stack[top]:=u;
    dec (top);
end;

procedure topo;
var u:longint;

begin
    fillchar (free,sizeof(free),true);
    top:=n;
    for u:=1 to n do
     if free[u] then visit (u);
end;

procedure xuli;
var i,j,u,v,k:longint;
begin
    for i:=1 to n do d[i]:=maxc;
    d[s]:=0;
    for i:=1 to n-1 do
    begin
        u:=stack[i];
        for k:=h[u]+1 to h[u+1] do
        begin
            v:=adj[k];
            if d[u]+adv[k]>d[v] then
            begin
                d[v]:=d[u]+adv[k];
                trace[v]:=u;
            end;
        end;
    end;
    for i:=1 to n do
     if d[i]=maxc then write ('INF ') else write (d[i],' ');
end;

Begin
   Assign (input,fi); Reset (input);
   Assign (output,fo); Rewrite (output);
   docfile;
   topo;
   xuli;
   Close (input); Close (output);
End.


