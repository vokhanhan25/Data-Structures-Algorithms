const maxn=5000;
      maxc=2000000000;
      maxm=20001;
      fi='.inp';
      fo='.out';
type rec=record
     x,y,c:longint;
     end;
var  n,m:longint;
     e:array[0..maxm] of rec;
     free:array[0..maxn] of boolean;
     h:array[0..maxn] of longint;
     adv,adj:array[0..2*maxm] of longint;
     d:array[0..maxn] of int64;

procedure docfile;
var i,k,u,v:longint;
begin
  readln(n,m);;
  for i:=1 to m do
   begin
     readln(u,v,e[i].c);
     e[i].x:=u; inc(h[u]);
     e[i].y:=v; inc(h[v]);
   end;
  for i:=2 to n do h[i]:=h[i-1]+h[i];
  k:=h[n];
  for i:=1 to m do
  begin
      u:=e[i].x; v:=e[i].y;
      adj[h[u]]:=v; adv[h[u]]:=e[i].c; dec (h[u]);
      adj[h[v]]:=u; adv[h[v]]:=e[i].c; dec (h[v]);
  end;
  h[n+1]:=k;
end;


begin
   assign(input,fi); reset(input);
   assign(output,fo); rewrite(output);
   docfile;
   close(input);  close(output);
end.



