var a,b:int64;
function ucln(a,b:int64):int64;
begin
    if a=b then exit (a);
    if a=0 then exit (b);
    if b=0 then exit (a);
    if (a mod 2=0) and (b mod 2=0) then exit (2*ucln(a div 2,b div 2));
    if (a mod 2=0) and (b mod 2=1) then exit (ucln(a div 2, b));
    if (a mod 2=1) and (b mod 2=0) then exit (ucln(a, b div 2));
    if (a mod 2=1) and (b mod 2=1) then
     if a>b then exit (ucln ((a-b) div 2,b))
     else exit (ucln((b-a) div 2,a));
end;
begin
    readln (a,b);
    write (ucln(a,b));
end.

