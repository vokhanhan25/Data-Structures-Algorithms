uses math;
const fi='QBSTR.inp';
      fo='QBSTR.out';
      maxn=1000;
var n,m:longint; x,y:string;
F:array [0..maxn,0..maxn] of longint;
procedure rf;
var i:longint;
begin
    readln (x); m:=length(x);
    readln (y); n:=length(y);
end;

procedure pr;
var i,j:longint;
begin
    for i:=0 to m do F[i,0]:=i;
    for j:=0 to n do F[0,j]:=j;
    for i:=1 to m do
     for j:=1 to n do
      if x[i]=y[j] then F[i,j]:=F[i-1,j-1]
      else F[i,j]:=min(F[i-1,j],min(F[i-1,j-1],F[i,j-1]))+1;
    write (F[m,n]);
end;

procedure wf;
begin
    while (m<>0) or (n<>0) do
    begin
        if x[m]=y[n] then
        begin
            dec (m);
            dec (n);
        end
        else
        begin
        if F[m,n]=F[m,n-1]+1 then
        begin
            insert (y[n],x,m+1);
            dec (n);
        end
        else if F[m,n]=F[m-1,n-1]+1 then
        begin
            x[m]:=y[n];
            dec (m); dec (n);
        end
        else if F[m,n]=F[m-1,n]+1 then
        begin
            delete (x,m,1);
            dec (m);
        end;
        writeln (x);
        end;
    end;
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    rf;
    pr;
    wf;
    close (input); close (output);
end.

