const fi='PERMUTE.inp';
      fo='PERMUTE.out';
var n:longint;
x:array [1..102] of longint;
procedure docfile;
begin
    readln (n);
end;

procedure swap(var a,b:longint);
var tm:longint;
begin
    tm:=a;
    a:=b;
    b:=tm;
end;

procedure xuli;
var i,k,a,b:longint;
begin
    for i:=1 to n do x[i]:=i;
    repeat
        for i:=1 to n do write (x[i],' ');
        writeln;
        i:=n-1;
        while (i>0) and (x[i]>x[i+1]) do dec (i);
        if i>0 then
        begin
            k:=n;
            while x[k]<x[i] do dec (k);
            swap(x[k],x[i]);
            a:=i+1; b:=n;
            while a<b do
            begin
                swap(x[a],x[b]);
                inc (a);
                dec (b);
            end;
        end;
    until i=0;
end;

begin
    assign (input,fi); reset(input);
    assign (output,fo); rewrite (output);
    docfile;
    xuli;
    close (input); close (output);
end.
