uses math;
const fi='COLORING.inp';
      fo='COLERING.out';
      maxn=10;
type rec=record
     x,y,cs:longint;
     end;
var n,m:longint; res:int64;
a:array [1..maxn] of rec;
x,kq:array [1..maxn] of longint;
procedure rf;
var i:longint;
begin
    readln (n,m);
    for i:=1 to n do
     with a[i] do
     begin
      readln (x,y);
      cs:=i;
     end;
end;

function kc(x1,y1,x2,y2:longint):int64;
begin
    exit (sqr(x1-x2)+sqr(y1-y2));
end;

procedure sort (d,c:longint);
var i,j,k,tm:longint; tn:rec;
begin
    i:=d; j:=c;
    k:=x[(d+c) div 2];
    repeat
       while (x[i]<k) do inc (i);
       while (x[j]>k) do dec (j);
       if i<=j then
       begin
           tm:=x[i];
           x[i]:=x[j];
           x[j]:=tm;
           tn:=a[i];
           a[i]:=a[j];
           a[j]:=tn;
           inc (i); dec (j);
       end;
    until i>j;
    if d<j then sort (d,j);
    if i<c then sort (i,c);
end;


procedure pr;
var i,j,dem:longint; s,minc:int64;
begin
    minc:=trunc(1e8);
    for i:=1 to n-1 do
     for j:=i+1 to n do
      if x[i]=x[j] then
      begin
          s:=kc(a[i].x,a[i].y,a[j].x,a[j].y);
          minc:=min(minc,s);
      end;
    if minc>res then
    begin
        res:=minc;
        for i:=1 to n do kq[i]:=x[i];
    end;
end;

procedure try (i:longint);
var j:longint;
begin
    for j:=1 to m do
    begin
        x[i]:=j;
        if i=n then pr
        else if i<n then try (i+1);
    end;
end;

procedure wf;
var i:longint;
begin
    for i:=1 to n do write (kq[i],' ');
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    rf;
    res:=0;
    try (1);
    wf;
    close (input); close (output);
end.

