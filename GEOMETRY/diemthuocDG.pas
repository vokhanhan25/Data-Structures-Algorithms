const   maxn=100;
type	xy=record x,y:longint; end;
var	n:byte;
	a:array[1..maxn+1] of xy;
	a1,a2,x1,x2,y1,y2,b1,b2,c1,c2:longint;
        d,dx,dy:real;
	k,dem,dem1,i:longint;

procedure nhap;
begin
	readln(n);
	fillchar(a,sizeof(a),0);
	for i:=1 to n do readln(a[i].x,a[i].y);
	readln(a[n+2].x,a[n+2].y);
	a[n+1]:=a[1];
end;

function kiemtradinh:boolean;
begin
	kiemtradinh:=true;
	for i:=1 to n do
		if (a[i].x=a[n+2].x) and (a[i].y=a[n+2].y) then exit;
		kiemtradinh:=false;
end;

function kiemtracanh:boolean;
begin
	kiemtracanh:=true;
	for i:=1 to n do
		if a[n+2].x*(a[i].y-a[i+1].y)+a[n+2].y*(a[i+1].x-a[i].x)+a[i].x*a[i+1].y-a[i].y*a[i+1].x=0 then exit;
		kiemtracanh:=false;
end;

function kiemtra_giaodiem(xo,yo,xc,yc,xd,yd:longint):boolean;
var	xa,ya,xb,yb:longint;

        function ktra(xo,yo:real;xa,ya,kb,yb:longint):boolean;
        var	max1,min1,max2,min2:longint;
        begin
	        if xa>xb then
            begin
		        max1:=xa;
		        min1:=xb;
	        end
	        else
	        begin
		        max1:=xb;
		        min1:=xa;
	        end;
	        if ya>yb then
	        begin
		        max2:=ya;
		        min2:=yb;
	        end
	        else
	        begin
		        max2:=yb;
		        min2:=ya;
	        end;
	        if (min1<=xo) and (xo<=max1) and (min2<=yo) and (yo<=max2) then ktra:=true else ktra:=false;
        end;
begin
	xa:=xo;
	ya:=yo;
	xb:=xo+1;
	yb:=yo;
	a1:=yb-ya;
	b1:=xa-xb;
	c1:=ya*xb - xa*yb;
	a2:=yd-yc;
	b2:=xc-xd;
	c2:=yc*xd-xc*yd;
	D:=a1*b2-a2*b1;
	Dx:=c2*b1-c1*b2;
	Dy:=a2*c1-a1*c2;
	if ((D<>0) and (ktra(Dx/D,Dy/D,xc,yc,xd,yd)) and ((Dx/D-xa)*(xb-xa)>=0) and ((Dy/D-ya)*(yb-ya)>=0)) or ((yc=yd) and (yc=yo)) then
	exit(true) else exit(false);
end;

function main:boolean;
begin
	main:=true;
	if kiemtradinh then exit;
	if kiemtracanh then exit;
	dem:=0;
	dem1:=0;
	for i:=1 to n do
		if kiemtra_giaodiem(a[n+2].x,a[n+2].y,a[i].x,a[i].y,a[i+1].x,a[i+1].y) then dem:=dem+1;
	if dem mod 2=0 then exit(false);
end;

begin
	assign(input,'DL.inp');
	reset(input);
	assign(output,'DL.out');
	rewrite(output);
	if main then write('Nam trong da giac') else write('Dell nam trong da giac');
	close(input);
	close(output);
end.

