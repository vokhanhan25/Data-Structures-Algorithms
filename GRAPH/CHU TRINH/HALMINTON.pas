Const fi='HALMINTON.inp';
      fo='HALMINTON.out';
      maxn=30;
      maxm=maxn*maxn;
type rec=record
     x,y:longint;
     end;
Var n,m,top:longint;
free:array [1..maxn] of boolean;
adj:array [1..maxn*2] of longint;
h,x:array [1..maxn] of longint;
e:array [1..maxm] of rec;

Procedure docfile;
var i,u,v,k:longint;
begin
    readln (n,m);
    For i:=1 to n do h[i]:=0;
    For i:=1 to m do
    Begin
        Readln (u,v);
        e[i].x:=u;   e[i].y:=v;
        inc (h[u]); inc (h[v]);
    End;

    For i:=2 to n do h[i]:=h[i-1]+h[i];
    k:=h[n];
    For i:=1 to m do
    Begin
        u:=e[i].x; v:=e[i].y;
        adj[h[u]]:=v; dec(h[u]);
        adj[h[v]]:=u; dec(h[v]);
    End;
    h[n+1]:=k;
end;

procedure xuatfile;
var i:longint;
begin
    for i:=1 to n do write (x[i],' ');
    writeln (x[1],' ');
end;

procedure try (i:longint);
var v,u,k:longint;
begin
    u:=x[i-1];
    for k:=h[u]+1 to h[u+1] do
    begin
     v:=adj[k];
     if (i<=n) and free[v] then
     begin
         x[i]:=v;
         free[v]:=false;
         try (i+1);
         free[v]:=true;
     end
     else if (i=n+1) and (v=x[1]) then xuatfile;
    end;
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    docfile;
    fillchar (free,sizeof(free),true);
    x[1]:=1; free[1]:=false;
    try (2);
    close (input); close (output);
end.
