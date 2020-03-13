uses math;
const  fi='SAFENET2.inp';
       fo='SAFENET2.out';
       maxn=30000;
       maxm=100000;
type rec=record
     x,y:longint;
     end;
var
  n,count,scau,skhop,top,res,slt:longint;
  h,parent,num,low,child:array[0..maxn] of longint;
  e:array[0..maxm] of rec;
  st:array [0..maxn] of rec;
  adj:array[0..2*maxm] of longint;
  free:array[0..maxn] of boolean;

procedure rf;
var i,m,u,v,k:LongInt;
begin
    Read(n,m);
    for i:=1 to m do
    begin
        Readln (u,v);
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
    count:=0; scau:=0; skhop:=0; top:=0;
    for i:=1 to n do
    begin
        parent[i]:=0;
        num[i]:=0;
        child[i]:=0;
        free[i]:=false;
    end;
end;

procedure push (u,v:longint);
begin
    inc (top);
    st[top].x:=u;
    st[top].y:=v;
end;

procedure pop (var x,y:longint);
begin
    x:=st[top].x;
    y:=st[top].y;
    dec (top);
end;

procedure dfs(u :longint);
var k,i,v,dem,x,y:longInt;
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
               push(u,v);
               parent[v]:=u;
               dfs(v);
               low[u]:=min(low[u],low[v]);
               if low[v]>=num[u] then
               begin
                   dem:=0;
                   //inc (slt);
                   repeat
                      inc (dem);
                      pop (x,y);
                   until (x=u) and (y=v);
                   inc (dem);
                   res:=max(res,dem);
               end;
            end
            else low[u]:=min(low[u],num[v]);
        end;
    end;
end;

procedure pr;
var u,colap:longint;
begin
    res:=0;
    for u:=1 to n do
     if num[u]=0 then
     begin
         colap:=count;
         dfs(u);
         if count=colap+1 then
          if res<1 then res:=1;
     end;
     writeln (Res);
end;

Begin
 // Assign(Input,fi); Reset(Input);
 // Assign(Output,fo); Rewrite(Output);
  rf;
  init;
  pr;
  //Close(Input); Close(Output);
End.

