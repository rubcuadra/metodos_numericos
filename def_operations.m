figure('visible','off');
ber1 = @(x) -real(besselj(1,x*exp(pi/4)));
bei1 = @(x) imag(besselj(1,x*exp(pi/4)));
delta = @(x) ber1(x)-bei1(x);
rho0 = fsolve(delta,4);
x=0:0.1:4;
plot(x,delta(x),'linewidth',2);
hold on;
plot([rho0], [0], 'o', 'linewidth', 10);
text(rho0, 0.15, '\colorbox{white}{$\rho_0$}', \
'horizontalalignment', 'center');
text(rho0, -0.2, \
sprintf('\\colorbox{white}{$%.2f$}', rho0), \
'horizontalalignment', 'center');
title (''); legend ('off'); grid();
xlabel('$\rho$');
ylabel('$\ber_1\rho-\bei_1\rho$');
print -depslatex '-S600,400' 'kelvin-fig.tex'
