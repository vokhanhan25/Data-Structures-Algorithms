uses math;
const maxn=10000;
      maxm=100000;
type rec=record
      x,y:longint;
      end;
var adj:array[0..2*maxm] of longint;
    stack,num,low,h:array[0..maxn] of longint;
    e:array[0..maxm] of rec;
    free:array[0..maxn] of boolean;
    res,n,m,count,top:longint;
procedure enter;
var i:longint;
begin
  readln(n,m);
  for i:=1 to m do
  begin
    readln(e[i].x,e[i].y);
    inc(h[e[i].x]);
  end;
  for i:=2 to n do h[i]:=h[i-1]+h[i];
  for i:=1 to m do
  begin
    adj[h[e[i].x]]:=e[i].y;
    dec(h[e[i].x]);
  end;
  h[n+1]:=m;
  count:=0;
  top:=0;
  res:=0;
  for i:=1 to n do
  begin
      num[i]:=0;
      free[i]:=true;
  end;
end;

procedure dfs(u:longint);
var k,v:longint;
begin
 count:=count+1;
 num[u]:=count;
 low[u]:=count;
 inc(top); stack[top]:=u; //dua u vao stack
 for k:=h[u]+1 to h[u+1] do
 begin
   v:=adj[k];
   if free[v] then
   if num[v]>0 then //v da tham
      low[u]:=min(low[u],num[v])
     else  // v chua tham
        begin
            dfs(v); //di tham v
            low[u]:=min(low[u],low[v]);
    end;
  end;
  // den day u duoc duyet xong
  if low[u]>=num[u] then
  begin
    inc(res);
    repeat
      v:=stack[top];
      free[v]:=false;
      dec(top);
   //   write (v,' ');
    until v=u;
  //  writeln;
  end;
end;

procedure tarjan;
var v:longint;
begin
  for v:=1 to n do
    if  num[v]=0 then dfs(v);
end;
begin
  assign(input,'tarjan.inp'); reset(input);
  assign(output,'tarjan.out'); rewrite(output);
  enter;
  tarjan;
  writeln(res);
  close(input); close(output);
end.

