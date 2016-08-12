#!/usr/bin/octave


x=(0:0.1:2)';
xaxis=[x,0.*x];
yaxis=[0.*x,x];

function nn = N(c)
nn=0.1./c.+0.15.*(1.+cos(6.*c)).+0.2.*c.^2;
end;

c1=0.545;
c2=1.115;
c3=1.468;
PT1=[c1,N(c1)];
PT2=[c2,N(c2)];
PT3=[c3,N(c3)];

c=(0:0.01:c1)';
FIG1=[c,N(c)];

plot(c,N(c),'-');
hold on;

c=(c1:0.01:c2)';
FIG2=[c,N(c)];

plot(c,N(c),'-');
hold on;

c=(c2:0.01:c3)';
FIG3=[c,N(c)];

plot(c,N(c),'-');
hold on;

c=(c3:0.01:2)';
FIG4=[c,N(c)];

plot(c,N(c),'-');
hold on;

text(0.54500,  0.24413,strcat('$\hskip -3pt\star$'))
text(1.11500,  0.62609,strcat('$\hskip -3pt\star$'))
text(1.46800,  0.52676,strcat('$\hskip -3pt\star$'))
ylabel('$Q(\phi\sb\omega)$')
xlabel("$\\omega$")
text(0.2,0.7,strcat('\small\it stable'))
text(0.65,0.5,strcat('\small\it unstable'))
text(1.2,0.7,strcat('\small\it stable'))
text(1.77,0.75,strcat('\small\it unstable'))



#PTS=[0,0];


#plot(FIG1(:,1),FIG1(:,1),'-')
#gplot [0:2] [0:1] \
#
#    FIG2 with lines 3, \
#    FIG3 with lines 1, \
#    FIG4 with lines 3, \
#    xaxis with lines 1, \
#    yaxis with lines 1;
    


print('q-vs-omega.tex','-dpslatex')
