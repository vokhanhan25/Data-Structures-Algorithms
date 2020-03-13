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
  h,cha,num,low,con,d:array[0..maxn] of longint;
  e:array[0..maxm] of rec;
  adj:array[0..2*maxm] of longint;
  free:array[0..maxn] of boolean;

procedure rf;
var i,m,u,v,k:LongInt;
begin
    readln (n,m);
    for i:=1 to m do
    begin
        readln (u,v);
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
        cha[i]:=0;
        num[i]:=0;
        con[i]:=0;
        free[i]:=false;
    end;
end;

procedure dfs(u :longint);
var k,i,v :LongInt;
begin
    inc(count);
    num[u]:=count; low[u]:=num[u];
    for k:=h[u]+1 to h[u+1] do
    begin
        v:=adj[k];
        if cha[u]<>v then  {cung da duoc dinh chieu}
        begin
            if cha[v]=0 then //v chua tham
            begin
               cha[v]:=u;
               dfs(v);
               low[u]:=min(low[u],low[v]);
            end
            else low[u]:=min(low[u],num[v]); //v da tham
        end else inc (d[u]);
    end;
end;

procedure pr;
var u:longint;
begin
    for u:=1 to n do
     if cha[u]=0 then
     begin
         cha[u]:=-1;
         dfs(u);
     end;
end;

procedure wf;
var u,v:longint;
begin
   for v:=1 to n do
   begin
        u:=cha[v];
        if (u<>-1) and (low[v]>=num[v]) and (d[v]<=1) then
        begin
            inc (scau);
           // writeln (u,' ',v);
        end;
    end;

    for v:=1 to n do
     if cha[v]<>-1 then inc (con[cha[v]]);    //dem sl con cua moi nut

    fillchar (free,sizeof(free),false);
    for v:=1 to n do
     if cha[v]<>-1 then   // u khong phai la goc cay dfs
     begin
         u:=cha[v];
         if low[v]>=num[u] then
          free[u]:=free[u] or (cha[u]<>-1) or (con[u]>=2); //hoac u khong phai la goc cay dfs, hoac u co 2 con
     end;

    for u:=1 to n do
     if free[u] then inc(skhop);

    writeln (skhop,' ',scau);
end;

Begin
    assign(input,fi); reset(input);
    assign(output,fo); rewrite(output);
    rf;
    init;
    pr;
    wf;
    close(input); close(output);
End.



