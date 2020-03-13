uses math;
const fi='PNUMBER.inp';
      fo='PNUMBER.out';
      maxn=200000;
var l,r:longint;
s:array [0..maxn] of boolean;

procedure rf;
begin
    readln (l,r);
end;

procedure sanglr;
var i,j:longint;
begin
    fillchar (s,sizeof(s),true);
    i:=1;
    while i*i<=r do
    begin
        inc (i);
        j:=max(i*i,(l+(i-1)) div i*i);
        while j<=r do
        begin
            s[j-l]:=false;
            j:=j+i;
        end;
    end;
end;

procedure wf;
var i:longint;
begin
    for i:=max(l,2) to r do
     if s[i-l] then writeln (i,' ');
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    rf;
    sanglr;
    wf;
    close (input); close (output);
end.


