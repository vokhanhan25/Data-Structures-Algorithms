uses math;
const fi='toadonguyen.inp';
      fo='toadonguyen.out';
      maxn=100;
type rec=record
     x,y:longint;
     end;
var n:longint;

function ucln(a,b:longint):longint;
var tm:longint;
begin
    while b>0 do
    begin
        a:=a mod b;
        tm:=a; a:=b; b:=tm;
    end;
    exit (a);
end;

procedure rf;
var x1,y1,x,y,xt,yt,i,a,b,sd:longint;
begin
    a:=0; b:=0;
    readln (n);
    readln (x,y);
    x1:=x; y1:=y;
    for i:=2 to n do
    begin
        xt:=x; yt:=y;
        readln (x,y);
        a:=a+(x-xt)*(y+yt);
        b:=b+ucln(abs(x-xt),abs(y-yt));
    end;
    a:=a+(x1-x)*(y1+y);
    b:=b+ucln(abs(x1-x),abs(y1-y));
    sd:=round(abs(a/2)+b/2+1);
    writeln (sd);
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    rf;
    close (input); close (output);
end.
