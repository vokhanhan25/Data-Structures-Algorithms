uses math,gset,gutil;
const fi='BLURB.inp';
      fo='BLURB.out';
      maxn=100;
type ls=specialize Tless <longint>;
s=specialize tset <longint,ls>;

var n,t:longint;
a:array [1..maxn] of longint;
d:s; it:s.tIterator;

procedure rf;
var i:longint;
begin
    readln (n);
    d:=s.create;
    for i:=1 to n do
    begin
        read (a[i]);
        it:=d.find(a[i]);
        if it=nil then
        begin
            d.insert(a[i]);
            write (0,' ');
        end else write (1,' ');
    end;
end;

procedure pr;
begin

end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    rf;
    close (input); close (output);
end.
