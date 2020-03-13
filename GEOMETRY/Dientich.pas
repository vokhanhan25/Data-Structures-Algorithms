type    xy=record x,y:longint; end;
var	n:longint;
	a:array[1..10000] of xy;

procedure nhap;
var	i:longint;
begin
	readln(n);
	for i:=1 to n do readln(a[i].x,a[i].y);
	a[i+1]:=a[1];
end;

procedure main;
var	s:real;
        i:longint;
begin
	s:=0;
	for i:=1 to n do s:=s+(a[i].x-a[i+1].x)*(a[i].y+a[i+1].y);
	s:=s/2;
	writeln(s:0:2);
end;

begin
	assign(input,'DL.inp');
	reset(input);
	assign(output,'DL.out');
	rewrite(output);
		nhap;
		main;
	close(input);
	close(output);
end.

