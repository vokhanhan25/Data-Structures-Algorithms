uses math;
const fi='NUMSET.inp';
      fo='NUMSET.out';
var a,b,res,m:int64; st:ansistring; n:longint;
kq:array [1..10000000] of int64;

procedure rf;
var i:longint;
begin
    readln (st); n:=length(st);
    readln (a);
    readln (b);
end;

function getbit (x,i:longint):longint;
begin
    getbit:=(x shr (i-1)) and 1;
end;

procedure pr;
var i,j:longint; tm:string;  x:int64;
begin
    m:=0;
    for i:=1 to (1 shl n)-1 do
    begin
        tm:='';
        for j:=1 to n do
         if getbit(i,j)=1 then tm:=tm+st[j];
        val(tm,x);
        if (x>=a) and (x<=b) then
        begin
            inc (m);
            kq[m]:=x;
        end;
    end;
end;

procedure sort (d,c:longint);
var i,j:longint; tm,k:int64;
begin
    i:=d; j:=c;
    k:=kq[d+random(c-d+1)];
    repeat
      while kq[i]<k do inc (i);
      while kq[j]>k do dec (j);
      if i<=j then
      begin
          tm:=kq[i];
          kq[i]:=kq[j];
          kq[j]:=tm;
          inc (i); dec (j);
      end;
    until i>j;
    if i<c then sort(i,c);
    if d<j then sort(d,j);
end;

procedure wf;
var i,j:longint;
begin
    res:=1;
    for i:=2 to m do
     if kq[i]<>kq[i-1] then inc (res);
    write (res);
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    rf;
    pr;
    sort (1,m);
    wf;
    close (input); close (output);
end.
