const fi='LIS.inp';
      fo='LIS.out';
      maxn=300005;
var n,m,res:longint;
a,F,L,T:array [0..maxn] of longint;
procedure docfile;
var i:longint;
begin
    readln (n);
    for i:=1 to n do read (a[i]);
end;

function search(i:longint):longint;
var d,c,k,j:longint;
begin
    d:=1; c:=m+1;
    repeat
       k:=(d+c) div 2;
       j:=F[k];
       if a[j]>a[i] then d:=k else c:=k;
    until d+1=c;
    exit (F[d]);
end;

procedure init;
begin
    a[0]:=-maxlongint; a[n+1]:=maxlongint;
    m:=1; L[n+1]:=1;
    F[1]:=n+1;
end;

procedure pr;
var i,j,k:longint;
begin
    for i:=n downto 0 do
    begin
        j:=search(i);
        k:=L[j]+1;
        if k>m then
        begin
            m:=k;
            F[k]:=i;
        end
        else if a[F[k]]<a[i] then F[k]:=i;
        L[i]:=k;
        T[i]:=j;
    end;
end;

procedure wf;
var i:longint;
begin
    writeln (m-2);
   { i:=T[0];
    while i<>n+1 do
    begin
        write (a[i],' ');
        i:=t[i];
    end;      }
end;

begin
    //assign (input,fi); reset(input);
    //assign (output,fo); rewrite (output);
    docfile;
    init;
    pr;
    wf;
    //close (input); close (output);
end.

