uses math;
const fi='thanghang.inp';
      fo='thanghang.out';
      maxn=100;
type rec=record
     x,y:longint;
     end;
var n,c:longint;
a:array [1..maxn] of rec;
free:array [1..maxn] of boolean;

procedure rf;
var i:longint;
begin
    readln (n);
    for i:=1 to n do
     with a[i] do readln (x,y);
end;

procedure pr;
var i,j,k,x1,y1,tm:longint;
// kiem tra co bao nhieu bo 3 diem thang hang
begin
    c:=0;
    for i:=1 to n-1 do
    begin
        fillchar (free,sizeof(free),true);
        for j:=i+1 to n-1 do
         if free[j] then
         begin
             tm:=1;
             x1:=a[j].x-a[i].x;
             y1:=a[j].y-a[i].y;
             for k:=j+1 to n do
              if free[k] then
               if x1*(a[k].y-a[i].y)=y1*(a[k].x-a[i].x) then
               begin
                   inc (tm);
                   free[k]:=false;
               end;
             inc (c,tm*(tm-1) div 2);
         end;
    end;
    writeln (c);
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    rf;
    close (input); close (output);
end.
