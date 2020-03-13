const fi='QBHV.inp';
      fo='QBHV.out';
      maxn=10;
var n,res:longint; st:string;
a:array ['A'..'Z'] of longint;

procedure rf;
var i:longint; x:char;
begin
    n:=0; st:='';
    while not seekeof() do
    begin
        read (x);
        inc (n);
        inc (a[x]);
    end;
end;

function gt(n:longint):longint;
var s,i:longint;
begin
    s:=1;
    for i:=2 to n do s:=s*i;
    exit (s);
end;

procedure pr;
var i:char;
begin
    res:=gt(n);
    for i:='A' to 'Z' do
     if a[i]>0 then res:=res div gt(a[i]);
    writeln (res);
end;

procedure try (i:longint);
var j:char;
begin
    for j:='A' to 'Z' do
     if a[j]>0 then
     begin
         dec (a[j]);
         st:=st+j;
         if i<n then try (i+1) else writeln (st);
         inc (a[j]);
         delete (st,i,1);
     end;
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    rf;
    pr;
    try(1);
    close (input); close (output);
end.

