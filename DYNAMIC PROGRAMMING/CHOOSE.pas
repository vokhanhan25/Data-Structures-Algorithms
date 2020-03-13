uses math;
const fi='CHOOSE.inp';
      fo='CHOOSE.out';
      maxn=500;
var n,m:longint;
a:array [0..maxn,0..maxn] of longint;
b:array [1..maxn] of longint;
procedure rf;
var i,j:longint;
begin
    readln (m,n);
    for i:=1 to m do
    begin
        for j:=1 to n do read (a[i,j]);
        readln;
    end;
end;

procedure pr;
var i,j,c1,c2,m1,m2,tm,res:longint;
begin
   res:=0;
    for c1:=1 to n-1 do
     for c2:=c1+1 to n do
     begin
         m1:=-maxlongint; m2:=-maxlongint;
         if (c1=2) and (c2=4) then
         begin
             write;
         end;
         for i:=1 to m do
         begin
            b[i]:=a[i,c1]+a[i,c2];
            if b[i]>m2 then
            begin
                if b[i]>m1 then
                begin
                    tm:=m1;
                    m1:=m2;
                    m2:=tm;
                    m1:=b[i];
                end
                else m2:=b[i];
            end;
         end;
         tm:=m1+m2;
         res:=max(res,tm);
     end;
      write (res);
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    rf;
    pr;
    close (input); close (output);
end.
