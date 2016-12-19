function [x, fval, exitflag] = sympleks2(f,A,b)%maksymalizujemy f
base=(1+size(A,2)):(size(A,2)+size(A,1));

%A=[A eye(size(A,1))];
V = b;
for i=1:length(b)
    if b(i)<0
        V(i) = -1;
        b(i) = -b(i);
        A(i,:) = -A(i,:);
    else
        V(i) = 1;
    end
end
A = [A eye(size(A,1))]
b
M = 1000*ones(1, length(b))
c = [f -M]

cb=-M'

z=dot(A,cb*ones(1,length(c)))
zc=z-c

b = b'

i=1;
while any(zc<0);
    [R,in]=min(zc);% szukamy indeksu minimum z wiersza z - c
    if not(any(A(:,in)>0))% je¿eli wszystkie poni¿ej 0 to nie ma rozwiazania
        exitflag=0;
        return
    end
    
    buf=b./A(:,in);%dzielimy wybran¹ kolumnê b przez A
    buf(A(:,in)<=0)=inf;%interesuj¹ nas tylko wartoœci dodatnie
    [R,out]=min(buf);%szukamy indeksu minimum z tej kolumny
    
    %eliminacja macierzy
    b(out)=b(out)/A(out,in);
    A(out,:)=A(out,:)./A(out,in);
    
    S=(A(:,in)./A(out,in));
    S(out)=0;
    b=b-b(out)*S;
    
    T=(A(:,in)./A(out,in))*A(out,:);
    T(out,:)=zeros(1,size(A,2));
    A=A-T;
    
    cb(out)=c(in);%podmieniamy wartoœæ wspó³czynnika przy zmiennej bazowej
    z=dot(A,cb*ones(1,length(c)));%sumujemy w s³upkach kolumny A pomno¿one przez wspó³czynniki zmiennych bazowych
    zc=z-c;%aktualizujemy wiersz z - c
    base(out)=in;%podmieniamy wartoœæ indeksu bazowego
    b
    displayIteration(A, b, base, i, zc);
    i=i+1;
end
exitflag=1;

x = prepareX(A,b,base, f);
fval = dot(x,f);

end

function displayIteration(A, b, base, i, zc)
    disp(sprintf('\n\niteracja %d:\n', i));
    disp('indeksy bazowe:')
    disp(base)
    disp('tabela A:')
    disp(A)
    disp('wiersz z - c:')
    disp(zc)
end
function x = prepareX(A, b, base, f)
x=zeros(1,size(A,2));
x(base(:))=x(base(:))+b(:)'%do zmiennych bazowych dodajemy otrzymane algorytmem wartoœci
x=x(1:length(f));%zostawiamy tylko zmienne wejœciowe
end
