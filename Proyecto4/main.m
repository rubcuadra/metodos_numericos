V = transpose([2 0 1; 3 2 0; 1 1 1]);
[VO R] = ortogonaliza(V);

VO =[

   2.00000   0.60000  -0.34483
   0.00000   2.00000   0.51724
   1.00000  -1.20000   0.68966]
R  = 3

iX = zeros(1,3);
iY = iX;
iZ = iY;


quiver3(iX,iY,iZ,[2 0 1],[0.6 2 -1.2],[-0.34483 0.51724 0.68966],'maxheadsize',0.06,'color','b')


grid minor on
title('Representacion')
text(1,-1,'Vectores Ortonormales','color','b')

pause