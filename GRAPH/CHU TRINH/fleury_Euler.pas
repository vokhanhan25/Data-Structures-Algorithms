Const fi='FLEURY_EULER.inp';
      fo='FLEURY_EULER.out';
      maxc=102;
Var
c:array [1..102,1..102] of longint;
n,m:longint;
Procedure docfile;
var i,u,v:longint;
begin
    readln (n,m);
    For i:=1 to m do
    begin
        readln (u,v,c[u,v]);
        c[v,u]:=c[u,v];
    end;
end;

Function testback(x,y:longint):boolean;
var q:array [1..1000000] of longint;
first,last,u,v:longint;
free:array [1..maxc] of boolean;
begin
    dec (c[x,y]); dec (c[y,x]);
    fillchar (free,sizeof(free),true);
    free[y]:=false;
    first:=1; last:=1;
    q[1]:=y;
    repeat
        u:=q[first]; inc (first);
        for v:=1 to n do
         if free[v] and (c[u,v]>0) then
         begin
             inc (last); q[last]:=v;
             free[v]:=false;
             if free[x] then break;
         end;
    until first>last;
    testback:=not free[x];
    inc (c[x,y]); inc (c[y,x]);
end;

procedure fleury;
var count,s,next,v:longint;
begin
    s:=1; write (1,' ');
    count:=1;
    repeat
       next:=0;
       for v:=1 to n do
        if c[s,v]>0 then
        begin
            next:=v;
            if testback(s,next) then Break;
        end;
        if next<>0 then
        begin
            dec (c[s,next]);
            dec (c[next,s]);
            write (next,' '); inc (count);
            if count mod 16=0 then Writeln;
            s:=next;
        end;
    until next=0;
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    docfile;
    fleury;
    close (input); close (output);
end.
