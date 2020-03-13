const fi='ANALYSE.inp';
      fo='ANALYSE.out';
var n:longint;
t,x:array [0..102] of longint;
procedure docfile;
var i:longint;
begin
    readln (n);
    x[0]:=1;
    t[0]:=0
end;

procedure xuatfile (k:longint);
var i:longint;
begin
    for i:=1 to k do write (x[i],' ');
    writeln;
end;

procedure try(i:longint);
var j:longint;
begin
    for j:=x[i-1] to (n-T[i-1]) div 2 do
    begin
        x[i]:=j;
        t[i]:=t[i-1]+j;
        try(i+1);
    end;
    x[i]:=n-t[i-1];
    xuatfile (i);
end;

begin
    assign (input,fi); reset(input);
    assign (output,fo); rewrite (output);
    docfile;
    try (1);
    close (input); close (output);
end.
