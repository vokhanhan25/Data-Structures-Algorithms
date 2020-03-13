const maxn=5000;
      maxc=2000000000;
      maxm=20001;
      fi='DIJKSTRA.inp';
      fo='DIJKSTRA_HEAP.out';
type rec=record
     x,y,c:longint;
     end;
var  n,m,nheap,s,f:longint;
     e:array[0..maxm] of rec;
     free:array[0..maxn] of boolean;
     pos,heap,h,trace:array[0..maxn] of longint;
     adv,adj:array[0..2*maxm] of longint;
     d:array[0..maxn] of int64;

procedure rf;
var i,k,u,v:longint;
begin
    readln(n,m,s,f);
    for i:=1 to m do
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

procedure dijkstra;
var i,u,v,k:longint;
begin
    fillchar (free,sizeof(Free),true);
    fillchar (pos,sizeof(pos),0);
    fillchar (trace,sizeof(trace),0);
    for i:=1 to n do d[i]:=maxc;
    d[s]:=0; nheap:=0;
    update(s);
    repeat
     u:=pop(1);
     if (u=f) or (u=0) then break;
     free[u]:=false;
     for k:=h[u]+1 to h[u+1] do
     begin
        v:=adj[k];
        if free[v] then
        if (d[v]>d[u]+adv[k]) then
        begin
            d[v]:=d[u]+adv[k];
            trace[v]:=u;
            update(v);
        end;
    end;
    until nheap=0;
end;

procedure wf;
begin
    writeln (d[f]);
    while f<>s do
    begin
       write (f,' ');
       f:=trace[f];
    end;
    write (s);
end;

begin
   assign(input,fi); reset(input);
   assign(output,fo); rewrite(output);
   rf;
   dijkstra;
   wf;
   close(input);  close(output);
end.



