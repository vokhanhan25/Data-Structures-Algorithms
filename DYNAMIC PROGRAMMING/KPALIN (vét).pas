uses math;
const fi='KPALIN.inp';
      fo='KPALIN.out';
      maxn=200;
var n,m,res,k:int64; st:string;
a:array [1..maxn] of longint;
f:array [1..maxn,1..maxn] of longint;

function ktdx(st:string):boolean;
var i,n:longint;
begin
    n:=length(st);
    for i:=1 to n div 2 do
     if st[i]<>st[n-i+1] then exit (false);
    exit (true);
end;

function getbit (x,i:longint):longint;
begin
    exit((x shr (i-1)) and 1);
end;

procedure pr;
var i,j:longint; tm:string;  x:int64;
begin
    res:=0;
    for i:=1 to (1 shl n)-1 do
    begin
        tm:='';
        for j:=1 to n do
         if getbit(i,j)=1 then tm:=tm+st[j];
        if (tm<>'') and (tm<>#0)  and ktdx(tm) then
        begin
            val(tm,x);
            if x mod k=0 then inc (res);
        end;
    end;
    res:=res mod m;
    writeln (Res);
end;

procedure rf;
var i:longint;
begin
    readln (n,k,m);
    readln (st);
    pr;
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    rf;
    close (input); close (output);
end.

