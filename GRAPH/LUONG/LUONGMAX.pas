Const   max=1000;
        maxc=1000001;
        fi='';
        fo='';
var c,f:array[1..max,1..max] of longint;
    trace,delta:array[1..max] of longint;
    m,n,A,B:longint;
procedure docfile;
var f:text;
    u,v,i:longint;
begin
   assign(f,fi);
   reset(f);
   fillchar(c,sizeof(c),0);
   readln(f,n,m,A,B);
   for i:=1 to m do readln(f,u,v,c[u,v]);
   close(f);
end;
Function min(x,y:longint):longint;
begin
   if x<y then min := x else min:=y;
end;
Function findPath:boolean;
var u,v:longint;
     q:array[1..max] of longint;
     first,last:longint;
begin
   fillchar(trace,sizeof(trace),0);
   first:=1;last:=1;
   q[last]:=A;
   trace[A]:=n+1;
   delta[A]:=maxc;
   repeat
     u:=q[first]; inc(first);
     for v:=1 to n do
       if trace[v]=0 then
       begin
          if (f[u,v]<c[u,v]) {and (c[u,v]<>0)}then {(u,v) la cung thuan}
             begin
               trace[v]:=u;
               delta[v]:=min(delta[u],c[u,v]-f[u,v])
             end
            else
            if (f[v,u]>0) {and (c[v,u]<>0)}then
               begin
                 trace[v]:=-u;
                 delta[v]:=min(delta[u],f[v,u]);
               end;
          if trace[v]<>0 then
          begin
             if v=B then
              begin
                findPath:=true;
                exit;
              end;
             inc(last);
             q[last]:=v;
          end;
      end;
   until first>last;
   findpath:=false;
end;
Procedure tangluong;
var incvalue,u,v:longint;
begin
  incvalue:=delta[B];
  v:=B;
  repeat
    u:=trace[v];
    if u>0 then f[u,v]:=f[u,v]+incvalue
    else
    begin
      u:=-u;
      f[v,u]:=f[v,u]-incvalue;
    end;
    v:=u;
  until v=A;
end;
procedure ghifile;
var g:text;
   u,v,m:longint;
begin
  assign(g,fo);
  rewrite(g);
  m:=0;
  for u:=1 to n do
    for v:=1 to n do
     if f[u,v]>0 then
       begin
         //writeln(g,'f(',u,',',v,')=',f[u,v]);
         if u=A then m:=m+f[A,v];
       end;
    writeln(g,m);
  close(g);
end;
procedure thuchien;
begin
  fillchar(f,sizeof(f),0);
  repeat
     if not findpath then break;
     tangluong;
  until false;
end;
BEGIN
  docfile;
  thuchien;
  ghifile;
END.

