uses math;
const fi='NKLINEUP.inp';
      fo='NKLINEUP.out';
var n,Q,minc,maxc:longint;
Tmin,Tmax:array [1..4*50000] of longint;
a:Array [1..50000] of longint;

procedure tv1 (k,d,c:longint);
var m:longint;
begin
    if d=c then
    begin
        Tmin[k]:=a[d];
        Tmax[k]:=a[d];
        exit;
    end;
    m:=(d+c) div 2;
    tv1(k*2,d,m);
    tv1(k*2+1,m+1,c);
    Tmin[k]:=min(Tmin[k*2],Tmin[k*2+1]);
    Tmax[k]:=max(Tmax[k*2],Tmax[k*2+1]);
end;

procedure tv2(k,d,c,i,j:longint);
var m:longint;
begin
    if (d>j) or (c<i) then exit;
    if (i<=d) and (j>=c) then
    begin
        maxc:=max(maxc,Tmax[k]);
        minc:=min(minc,Tmin[k]);
        exit;
    end;
    m:=(d+c) div 2;
    tv2(k*2,d,m,i,j);
    tv2(k*2+1,m+1,c,i,j);
end;

procedure docfile;
var i,u,v:longint;
begin
    readln (n,Q);
    for i:=1 to n do read (a[i]);
    tv1(1,1,n);
    for i:=1 to q do
    begin
        minc:=maxlongint; maxc:=-maxlongint;
        readln (u,v);
        tv2(1,1,n,u,v);
        writeln (maxc-minc);
    end;
end;


begin
  //  assign (input,fi); reset(input);
  //  assign (output,fo); rewrite (output);
    docfile;
    //xuli;
  //  close (input); close (output);
end.

