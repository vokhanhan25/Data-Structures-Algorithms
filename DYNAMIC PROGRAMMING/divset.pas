uses math;
const fi='DIVSET.inp';
      fo='DIVSET.out';
      maxn=200;
var n:longint; k,res:int64; st:string;
a,b,f:array [0..maxn] of longint;


function getbit (x,i:longint):longint;
begin
    exit((x shr (i-1)) and 1);
end;

function kt(k:longint):boolean;
var i,j:longint;
begin
   for i:=1 to k-1 do
         for j:=i+1 to k do
          if (b[i] mod b[j]<>0) and (b[j] mod b[i]<>0) then exit (false);
   exit (true);
end;

procedure sort (d,c:longint);
var i,j,k,tm:longint;
begin
    i:=d; j:=c;
   // kx:=a[(d+c) div 2].x;
    k:=a[d+random(c-d+1)];
    repeat
       while (a[i]<k) do inc (i);
       while (a[j]>k) do dec (j);
       if i<=j then
       begin
           tm:=a[i];
           a[i]:=a[j];
           a[j]:=tm;
           inc (i); dec (j);
       end;
    until i>j;
    if d<j then sort (d,j);
    if i<c then sort (i,c);
end;

procedure pr;
var i,j,ii,jj,k:longint;
begin
    res:=0;
    for i:=1 to (1 shl n)-1 do
    begin
        k:=0;
        for j:=1 to n do
         if getbit(i,j)=1 then
         begin
             inc (k);
             b[k]:=a[j];
         end;

        if kt(k) then res:=max(res,k);
    end;

    writeln (Res);
end;

procedure xuli;
var i,j:longint;
begin
    res:=0; sort (1,n);
    for i:=1 to n do
    begin
        f[i]:=1;
        for j:=1 to i-1 do
         if a[i] mod a[j]=0 then
          F[i]:=max(F[i],F[j]+1);
        res:=max(res,F[i]);
    end;
    write (res);
end;

procedure rf;
var i:longint;
begin
    readln (n);
    for i:=1 to n do read (a[i]);
    if n<=20 then pr else xuli;
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    rf;
    close (input); close (output);
end.

