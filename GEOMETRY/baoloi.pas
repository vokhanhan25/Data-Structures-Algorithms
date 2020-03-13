uses math;
const fi='BAOLOI.inp';
      fo='BAOLOI.out';
      esp=1/trunc(1e7);
      maxn=1000000;
type point=record
     x,y:longint;
     end;
var n:longint;
a,stack:array[1..maxn] of point;

procedure rf;
var i:Longint;
begin
    readln(n);
    for i:=1 to n do
     with a[i] do readln(a[i].x,a[i].y);
end;

procedure sort(d,c:Longint);
var i,j:longint; k,tm:point;
begin
    i:=d; j:=c;
    k:=a[(i+j) div 2];
    repeat
        while (a[i].x<k.x) or ((a[i].x=k.x) and (a[i].y<k.y)) do inc(i);
	while (a[j].x>k.x) or ((a[j].x=k.x) and (a[j].y>k.y)) do dec(j);
	if i<=j then
	begin
	    tm:=a[i];
	    a[i]:=a[j];
            a[j]:=tm;
	    inc(i); dec(j);
        end;
    until i>j;
    if i<c then sort(i,c);
    if d<j then sort(d,j);
end;

function dt (a,b,c:point):longint;
begin
    exit((a.x-b.x)*(a.y+b.y) +(b.x-c.x)*(b.y+c.y) + (c.x-a.x)*(c.y+a.y));
end;

procedure pr;
var top1,top2,i,tm:longint;
begin
    top1:=0;
    for i:=1 to n do
    begin
	while (top1>=2) and (dt(stack[top1-1],stack[top1],a[i])>0) do dec(top1);
	inc(top1);
	stack[top1]:=a[i];
    end;
    for i:=1 to top1 do
     with stack[i] do writeln(x,' ',y);

    top2:=0;
    for i:=n downto 1 do
    begin
	while (top2>=2) and (dt(stack[top2-1],stack[top2],a[i])>0) do dec(top2);
	inc(top2);
	stack[top2]:=a[i];
    end;
    for i:=2 to top2-1 do
     with stack[i] do writeln(x,' ',y);
end;

begin
    assign(input,fi); reset(input);
    assign(output,fo); rewrite(output);
    rf;
    sort (1,n);
    pr;
    close(input); close(output);
end.
