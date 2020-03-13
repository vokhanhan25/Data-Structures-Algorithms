uses math;
const fi='NKCABLE.inp';
      fo='NKCABLE.out';
      maxn=25000;
      maxv=1000000;
var n:longint;
f,a:array [1..102] of longint;
procedure docfile;
var i:longint;
begin
    readln (n);
    for i:=1 to n-1 do read (a[i]);
end;

procedure xuli;
var i:longint;
begin
    f[1]:=0; f[2]:=a[1]; f[3]:=a[1]+a[2];
    for i:=4 to n do f[i]:=min(f[i-1],f[i-2])+a[i-1];
end;

begin
    assign (input,fi); reset(input);
    assign (output,fo); rewrite (output);
    docfile;
    xuli;
    write (f[n]);
    close (input); close (output);
end.
