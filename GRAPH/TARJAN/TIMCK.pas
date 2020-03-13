uses math;
const  fi='GRAPH.inp';
       fo='GRAPH.out';
       maxn=10000;
       maxm=50000;
type rec=record
     x,y:longint;
     end;
var
  n,count,scau,skhop:longint;
  h,parent,num,low,child:array[0..maxn] of longint;
  e:array[0..maxm] of rec;
  adj:array[0..2*maxm] of longint;
  free:array[0..maxn] of boolean;

procedure rf;
var i,m,u,v,k:LongInt;
begin
    Read(n,m);
    for i:=1 to m do
    begin
        Read(u,v);
        e[i].x:=u; inc(h[e[i].x]);
        e[i].y:=v; inc(h[e[i].y]);
    end;
    for i:=2 to n do h[i]:=h[i-1]+h[i];
    k:=h[n];
    for i:=1 to m do
    begin
        adj[h[e[i].x]]:=e[i].y; dec(h[e[i].x]);
        adj[h[e[i].y]]:=e[i].x; dec(h[e[i].y]);
    end;
    h[n+1]:=k;
end;

procedure init;
var i:longint;
begin
    count:=0; scau:=0; skhop:=0;
    for i:=1 to n do
    begin
        parent[i]:=0;
        num[i]:=0;
        child[i]:=0;
        free[i]:=false;
    end;
end;

procedure dfs(u :longint);
var k,i,v :LongInt;
begin
    inc(count);
    num[u]:=count;
    low[u]:=count;
    for k:=h[u]+1 to h[u+1] do
    begin
        v:=adj[k];
        if parent[u]<>v then  {cung da duoc dinh chieu}
        begin
            if parent[v]=0 then //v chua tham
            begin
               parent[v]:=u;
               dfs(v);
               low[u]:=min(low[u],low[v]);
            end
            else low[u]:=min(low[u],num[v]);
        end;
    end;
end;

procedure pr;
var u:longint;
begin
    for u:=1 to n do
     if parent[u]=0 then
     begin
         parent[u]:=-1;
         dfs(u);
     end;
end;

procedure wf;
var u,v:longint;
begin
   for v:=1 to n do
   begin
        u:=parent[v];
        if (u<>-1) and (low[v]>=num[v]) then inc(scau);
    end;

    for v:=1 to n do
    begin
        u:=parent[v];
        if u<>-1 then inc(child[u]);
    end;

    for u:=1 to n do
     free[u]:=(parent[u]=-1) and (child[u]>=2);

    for v:=1 to n do
    begin
        u:=parent[v];
        if (u<>-1) and (parent[u]<>-1) and (low[v]>=num[u]) then free[u]:=true;
    end;

    for u:=1 to n do
     if free[u] then inc(skhop);

    writeln (skhop,' ',scau);
end;

Begin
  Assign(Input,fi); Reset(Input);
  Assign(Output,fo); Rewrite(Output);
  rf;
  init;
  pr;
  wf;
  Close(Input); Close(Output);
End.

