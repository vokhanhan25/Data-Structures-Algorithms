type    point=record x,y:longint; end;
		rec=record cs:longint; smanh:real; end;
var		a:Array[1..1000] of point;
		b:array[1..1001] of rec;
		i,n,dem:longint;
                vecto:point;
		min:point;
procedure qs(l,h:longint);
var	i,j:longint;
	k:real;
	x:rec;
begin
	i:=l;
	j:=h;
	k:=b[random(h-l)+l].smanh;
	repeat
		while b[i].smanh>k do inc(i);
		while b[j].smanh<k do dec(j);
		if i<=j then
		begin
			x:=b[i];
			b[i]:=b[j];
			b[j]:=x;
			inc(i);
			dec(j);
		end;
	until i>j;
	if i<h then qs(i,h);
	if j>l then qs(l,j);
end;
begin
	assign(input,'SAPXEPDIEM.inp');
	assign(output,'SAPXEPDIEM.out');
	reset(input);
	rewrite(output);
	readln(n);
	min.x:=maxint;
	for i:=1 to n do
		begin
		readln(a[i].x,a[i].y);
		if min.x>a[i].y then
			begin
			min.x:=a[i].y;
			min.y:=i;
			end;
		end;
	dem:=0;
	for i:=1 to n do
	if i<>min.y then
	begin
		vecto.x:=a[i].x-a[min.y].x;
		vecto.y:=a[i].y-a[min.y].y;
		inc(dem);
		b[dem].cs:=i;
		b[dem].smanh:=(vecto.x)/(sqrt(sqr(vecto.x)+sqr(vecto.y)));
	end;
	qs(1,dem);
	write(min.y,' ');
	for i:=1 to dem do write(b[i].cs,' ');
	close(input);
	close(output);
end.
