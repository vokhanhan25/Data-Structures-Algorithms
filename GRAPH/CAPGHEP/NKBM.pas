uses math;
const fi='NKBM.inp';
      fo='NKBM.out';
      maxn=10001;
      maxc=100000000;
var n,m,res,q:longint;
//a,b:array [1..maxn] of longint;
c:array [1..maxn,1..maxn] of longint;
size,ghep:array [1..maxn] of longint;
free:array [1..maxn] of boolean;
d:array [0..maxn] of longint;
procedure rf;
var i,j:longint;
begin
    readln (m,n,q);
    while q>0 do
    begin
        readln (i,j);
        inc (size[i]);
         c[i,size[i]]:=j;
        dec (q);
    end;
end;

function findpath:boolean;
var first,last,u,i,v:longint;
q:array [1..1000000] of longint;
begin
    first:=1; last:=0;
    for u:=1 to n do
     if free[u] then
     begin
         d[u]:=0;
         inc (last);
         q[last]:=u;
     end else d[u]:=maxc;
    d[0]:=maxc;

    repeat
       u:=q[first]; inc (first);
       for i:=1 to size[u] do
       begin
           v:=c[u,i];
           if d[ghep[v]]=maxc then
           begin
               d[ghep[v]]:=d[u]+1;
               if ghep[v]<>0 then
               begin
                   inc (last);
                   q[last]:=ghep[v];
               end;
           end;
       end;
    until first>last;
    if d[0]<>maxc then exit (true);
    exit (false);
end;


function dfs(u:longint):boolean;
var i,v:longint;
begin
    for i:=1 to size[u] do
    begin
        v:=c[u,i];
        if ghep[v]=0 then
        begin
            free[u]:=false;
            ghep[v]:=u;
            d[u]:=maxc;
            exit (true);
        end;
        if (d[ghep[v]]=d[u]+1) and (dfs(ghep[v])) then
        begin
            free[u]:=false;
            ghep[v]:=u;
            d[u]:=maxc;
            exit (true);
        end;
    end;
    d[u]:=maxc;
    exit (false);
end;

procedure pr;
var i,j:longint;
begin
    fillchar (Free,sizeof(free),true);

    res:=0;
    while findpath do
    begin
        for i:=1 to n do
         if free[i] and dfs(i) then inc (res);
    end;

    writeln (res);
    {for i:=1 to n do
     if ghep[i]<>0 then
     writeln (ghep[i],' ',i);   }
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    rf;
    pr;
    close (input); close (output);
end.

