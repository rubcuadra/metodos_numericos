syms x
f = taylor(log(1+x))
latex(f)
plot(f)
print('-dtex', 'exampl.tex');
pause 
