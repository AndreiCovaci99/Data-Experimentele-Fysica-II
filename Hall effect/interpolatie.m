function [yinter,syinter] = interpolatie(xinit,sx,yinit,sy,xinter,sxinter)
xmax=max(xinit);
xmax1= max(xinit(find(xinit<xmax)));
xmin=min(xinit);
xmin1= min(xinit(find(xinit>xmin)));
ymax=max(yinit);
ymax1= max(yinit(find(yinit<ymax)));
ymin=min(yinit);
ymin1= min(yinit(find(yinit>ymin)));

groter=xinter(find(xinter>xmax))
kleiner=xinter(find(xinter<xmin))

l=length(kleiner);
L=length(groter);

A=isempty(groter) && isempty(kleiner)

if A==1
    for n=1:length(xinter)
        x1=max(xinit(find(xinit<=xinter(n))));
        x2=min(xinit(find(xinit>xinter(n))));
        i1=find(xinit==x1) ;
        i2=find(xinit==x2) ;
        y1=yinit(i1);
        y2=yinit(i2);
        
        yinter(n)=y1+(y2-y1)/(x2-x1)*(xinter(n)-x1);
        
        sx1=sx(i1);
        sx2=sx(i2);
        sy1=sy(i1);
        sy2=sx(i2);
        
        dy1=1-1/(x2-x1)*(xinter(n)-x1)*sy1;
        dy2=1/(x2-x1)*(xinter(n)-x1)*sy2;
        dx1=((xinter(n)-x2)/(x2-x1)^2) *(y2-y1)*sx1;
        dx2=(-(y2-y1)/(x2-x1)^2)*(xinter(n)-x1)*sx2;
        dxinter=(y2-y1)/(x2-x1)*sxinter(n);
        
        syinter(n)=sqrt(dy1^2+dy2^2+dx1^2+dx2^2+dxinter^2);
        
        
    end
else
    if L>0
    for n=1:L
        ygroter(n)=xmax+(ymax1-ymax)/(xmax1-xmax)*(groter(n)-xmax);
       
    end
    else 
        ygroter=[];
    end
    if l >0
    for n=1:l
        ykleiner(n)=xmin+(ymin1-ymin)/(xmin1-xmin)*(kleiner(n)-xmin);
    end
    else
        ykleiner=[];
    end
    for n=l+1:length(xinter)-L-2
        x1=max(xinit(find(xinit<=xinter(n))))
        x2=min(xinit(find(xinit>xinter(n))))
        i1=find(xinit==x1) 
        i2=find(xinit==x2) 
        y1=yinit(i1);
        y2=yinit(i2);
        
        ytussen(n)=y1+(y2-y1)/(x2-x1)*(xinter(n)-x1);
        
        
    end
    yinter=[ykleiner,ytussen,ygroter];
    syinter=0
end
end

