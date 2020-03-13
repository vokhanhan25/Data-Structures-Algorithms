uses math;
const fi='PATH.inp';
      fo='PATH.out';
      maxn=100001;
      maxm=3*100001;
      maxc=trunc(1e7)+7;
type rec=record
     x,y,c:longint;
     end;
var n,m,w,na,nb,nheap:longint;
free:array [1..maxn] of boolean;
d,a,b,sl,h,heap,pos:array [1..maxn] of longint;
e:array [1..maxm] of rec;
adj,adv:array [1..2*maxm] of longint;
f:array [1..101,1..maxn] of longint;

procedure rf;
var i,u,v,x,k,sc:longint;
begin
    readln (n,sc,w,na,nb);
    m:=sc;
    for i:=1 to sc do
    begin
        readln(u,v,e[i].c);
        e[i].x:=u; inc(h[u]);
        e[i].y:=v; inc(h[v]);
    end;
    for i:=2 to n do h[i]:=h[i-1]+h[i];
    k:=h[n];
    for i:=1 to m do
    begin
        u:=e[i].x; v:=e[i].y;
        adj[h[u]]:=v; adv[h[u]]:=e[i].c; dec (h[u]);
        adj[h[v]]:=u; adv[h[v]]:=e[i].c; dec (h[v]);
    end;
    h[n+1]:=k;
end;

procedure upheap(i:longint);
var u,v:longint;
begin
    if (i=1) or (d[heap[i div 2]]<d[heap[i]]) then exit; {cha nho hon con i}
    u:=heap[i]; v:=heap[i div 2];
    heap[i]:=v;  heap[i div 2]:=u; {doi nhan giua cha va con}
    pos[u]:=i div 2;  pos[v]:=i;
    upheap(i div 2);
end;

procedure downheap(i:longint);
var j,u,v:longint;
begin
    j:=i*2;
    if j > nheap then exit;
    if (j<nheap) and (d[heap[j]]>d[heap[j+1]]) then inc(j);
    if d[heap[i]]>d[heap[j]] then
    begin
        u:=heap[i]; v:=heap[j];
        heap[i]:=v; heap[j]:=u;
        pos[u]:=j; pos[v]:=i;
        downheap(j);
    end;
end;

procedure update(v:longint);
var i:longint;
begin
    i:=pos[v];
    if i=0 then {v chua co trong heap}
    begin
       inc(nheap);
       heap[nheap]:=v;
       pos[v]:=nheap;
       upheap(nheap);
    end
    else begin
        upheap(i);
        downheap(i);
    end;
end;

function pop(v:longint):longint;
begin
    pop:=heap[v];
    heap[v]:=heap[nheap];
    dec(nheap);
    upheap(v);
    downheap(v);
end;

procedure dijkstra(s:longint);
var i,u,v,k:longint;
begin
    for i:=1 to n do
    begin
        d[i]:=maxc;
        free[i]:=true;
        pos[i]:=0;
    end;
    d[s]:=0; nheap:=0;
    update(s);
    repeat
     u:=pop(1);
     if (u=0) then break;
     free[u]:=false;
     for k:=h[u]+1 to h[u+1] do
     begin
        v:=adj[k];
        if free[v] then
        if (max(d[u],adv[k])<d[v]) then
        begin
            d[v]:=max(d[u],adv[k]);
            update(v);
        end;
    end;
    until nheap=0;
end;


procedure pr;
var i,j,res:longint;
begin
    for i:=1 to na do
    begin
        read (a[i]);
        dijkstra(a[i]);
        for j:=1 to n do f[a[i],j]:=d[j];
    end;
    readln;

    for i:=1 to nb do read (b[i]);

    res:=0;
    for i:=1 to na do
     for j:=1 to nb do
      if f[a[i],b[j]]=w then inc (Res);
    write (res);
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    rf;
    pr;
    close (input); close (output);
end.
