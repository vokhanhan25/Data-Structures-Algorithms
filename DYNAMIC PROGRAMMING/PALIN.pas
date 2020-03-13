uses math;
const fi='PALIN.inp';
      fo='PALIN.out';
      maxn=200;
var n,m,res:int64; st:string;
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
var i,j:longint; tm:string;
begin
    res:=1;
    for i:=1 to (1 shl n)-1 do
    begin
        tm:='';
        for j:=1 to n do
         if getbit(i,j)=1 then tm:=tm+st[j];
        if (tm<>'') and (tm<>#0)  and ktdx(tm) then inc (res);
    end;
    res:=res mod m;
    writeln (Res);
end;

procedure xuli;
var i,j:longint; tm:int64;
begin
   for i:=1 to n do F[i,i]:=1;
    for i:=n downto 1 do
     for j:=i+1 to n do
      if st[i]=st[j] then F[i,j]:=(F[i+1,j]+F[i,j-1]+1) mod m
      else
      begin
          tm:=F[i+1,j]+F[i,j-1]-F[i+1,j-1];
          if tm<0 then tm:=tm+m;
          F[i,j]:=tm mod m;
      end;
    writeln ((F[1,n]+1) mod m);
end;

procedure rf;
var i:longint;
begin
    readln (m);
    st:=' ';
    while true do
    begin
     readln (st);
     if st='' then exit;
     n:=length(st);
     if n<=20 then pr else xuli;
    end;
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    rf;
    close (input); close (output);
end.

