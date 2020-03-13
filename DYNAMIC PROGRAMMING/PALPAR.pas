uses math;
const fi='PALPAR.inp';
      fo='PALPAR.out';
      maxn=1000001;
      base=10000007;
var n,res,best:int64; st:ansistring;

function tinh (i,j:longint):longint;
var len,tm:longint; m,l,r:int64;
begin
    if i>j then exit (0);
//    if F[i,j]>-1 then exit (-F[i,j]);
    l:=0; r:=0; m:=1; best:=1;
    for len:=1 to (j-i+1) div 2 do
    begin
        l:=(l*255+ord(st[i+len-1])-97) mod base;
        r:=(r+m*(ord(st[j-len+1])-97)) mod base;
        if l=r then
        begin
            tm:=tinh (i+len,j-len);
            if tm+2>best then
            begin
                best:=tm+2;
                break;
            end;
        end;
        m:=(m*255) mod base;
    end;
    exit (best);
end;

procedure pr;
var i,j:longint;
begin
   { for i:=1 to n do
     for j:=1 to n do F[i,j]:=-1;   }
    writeln(tinh(1,n));

end;

procedure rf;
var i,t:longint;
begin
    readln (t);
    while t>0 do
    begin
        readln (st);
        n:=length(st);
        pr;
        dec (t);
    end;
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    rf;
    close (input); close (output);
end.

