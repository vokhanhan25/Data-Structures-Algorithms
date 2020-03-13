uses math;
const fi='HASH.inp';
      fo='HASH.out';
      base=10000007;
      maxn=1000000;
var t,p:ansistring;
n,k:Longint; hashp:int64;
pow,hash:array[0..maxn] of int64;

procedure rf;
begin
    readln (t); n:=length(t);
    readln (p); k:=length(p);
end;

procedure init;
var i:longint;
begin
    pow[0]:=1;
    for i:=1 to 26 do
     pow[i]:=(26*pow[i-1]) mod base;
end;

function gethash(i,j:longint):int64;
begin
    exit((hash[j]-hash[i-1]*pow[j-i+1]+base*base) mod base);
end;

procedure pr;
var i,j:longint;
begin
	hashp:=0;
	for i:=1 to k do
	 hashp:=(hashp*26+ord(p[i])-97) mod base;

	hash[0]:=0;
	for i:=1 to n do
         hash[i]:=(hash[i-1]*26+ord(t[i])-97) mod base;

	for i:=1 to n-k+1 do
		if hashp=gethash(i,i+k-1) then write(i,' '); // vi tri dau tien xuat hien cua xau p trong xau a
end;
begin
    assign(input,fi); reset(input);
    assign(output,fo); rewrite(output);
    rf;
    init;
    pr;
    close(input); close(output);
end.
