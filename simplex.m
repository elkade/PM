function [x, fval, exitflag] = simplex(f,A,b)
%maksymalizujemy f
base=1+size(A,2):size(b,1)+1+size(A,1)
b = b'
c=[f zeros(1,size(A,1))]
A=[A eye(size(A,1))]
z=zeros(size(A,2),1)
zc=-c
cb=zeros(size(A,1),1);

while any(zc<0);
    [M,in]=min(zc);
    if not(any(A(:,in)>0))
        exitflag=0;
        return
    end
    set=b./A(:,in);
    set(A(:,in)<0)=inf;
    [M,out]=min(set);
    b(out)=b(out)/A(out,in);
    A(out,:)=A(out,:)./A(out,in);
    cb(out)=c(in);
    
    Mul=(A(:,in)./A(out,in));
    Mul(out)=0;
    b=b-b(out)*Mul;
    
    Dif=(A(:,in)./A(out,in))*A(out,:);
    Dif(out,:)=zeros(1,size(A,2));
    A=A-Dif;
    disp('aktualna tabelka sympleksowa:')
    disp(A)
    
    z=dot(A,cb*ones(1,size(A,2)));

    zc=z-c;
    disp('aktualne indeksy bazowe:')
    base(out)=in;
    disp(base)
end
exitflag=1;

end