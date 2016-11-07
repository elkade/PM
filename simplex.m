function [x, fval, exitflag] = simplex(f,A,b)%maksymalizujemy f
base=(1+size(A,2)):(size(A,2)+size(A,1))
b = b';%prepareB(A,b,lb);
c=[f zeros(1,size(A,1))];
A=[A eye(size(A,1))]
zc=-c;
cb=zeros(size(A,1),1);
i=1;
while any(zc<0);
    [M,in]=min(zc);% szukamy indeksu minimum z wiersza z - c
    if not(any(A(:,in)>0))% je�eli wszystkie poni�ej 0 to nie ma rozwiazania
        exitflag=0;
        return
    end
    buf=b./A(:,in);%dzielimy wybran� kolumn� b przez A
    buf(A(:,in)<0)=inf;%interesuj� nas tylko warto�ci dodatnie
    [M,out]=min(buf);%szukamy indeksu minimum z tej kolumny
    b(out)=b(out)/A(out,in);
    A(out,:)=A(out,:)./A(out,in);
    
    S=(A(:,in)./A(out,in));
    S(out)=0;
    b=b-b(out)*S;
    
    T=(A(:,in)./A(out,in))*A(out,:);
    T(out,:)=zeros(1,size(A,2));
    A=A-T;
    
    cb(out)=c(in);%podmieniamy warto�� wsp�czynnika przy zmiennej bazowej
    z=dot(A,cb*ones(1,size(A,2)));%sumujemy w s�upkach kolumny A pomno�one przez wsp�czynniki zmiennych bazowych
    zc=z-c;%poprawiamy wiersz z - c
    base(out)=in;%podmieniamy warto�� indeksu bazowego
    displayIteration(A, b, base, i);
    i=i+1;
end
exitflag=1;
x = prepareX(A,b,base, f);
fval = dot(x,f);
end
function b = prepareB(A, b, lb)
lbM=ones(size(A,1),1)*lb;%pomocniczo kopiujemy wektor na macierz, zeby wykona� mno�enie
d=dot(A,lbM,2)';%mno�ymy ograniczenia przez wej�ciowe wsp�czynniki przy ograniczonych x-ach
b=b-d;% teraz odejmujemy, �eby po sympleksie z powrotem doda�
b=b';
end
function displayIteration(A, b, base, i)
    disp(sprintf('\n\niteracja %d:\n', i));
    disp('indeksy bazowe:')
    disp(base)
    disp('tabela sympleksowa A:')
    disp(A)
    disp('tabela sympleksowa b:')
    disp(b)
end
function x = prepareX(A, b, base, f)
x=zeros(1,size(A,2));
x(base(:))=x(base(:))+b(:)';%do zmiennych bazowych dodajemy otrzymane algorytmem warto�ci
x=x(1:length(f));%zostawiamy tylko zmienne wej�ciowe
end
function x = prepareX2(A, b, lb, base)
x=[lb zeros(1,size(A,1))];%do wektora ogranicze� dodajemy zera odpowiadaj�ce zmiennym pomocniczym
x(base(:))=x(base(:))+b(:)';%do zmiennych bazowych dodajemy otrzymane algorytmem warto�ci
x=x(1:length(lb));%zostawiamy tylko zmienne wej�ciowe
end