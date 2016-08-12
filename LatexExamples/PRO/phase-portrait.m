#!/usr/bin/octave
# Octave version 3


function w = xdot(x,t)
  k=0.2;
  w = [x(2),x(1)-x(1).^3.-k.*x(2)];
end;

T=(0:0.1:40)';
X=lsode('xdot',[0.2,3],T);

plot(X(:,1),X(:,2))
title ('Damped Oscillation');
xlabel ('$u$')
ylabel ('$\\dot u$')
grid off

text(0,0.5,strcat('$\dot u= v$'))
text(0,0,strcat('$\dot v= u-u^3-0.2 v$'))

print('phase-portrait.tex','-dpslatex')
#print('phase-portrait.eps','-deps')

