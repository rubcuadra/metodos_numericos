%ESTE RIFA
N=100;
grid_size=2*N
absorption=1

%% Will do T^3 steps, with T equal...
T=10;


% Nonlinearity:
function retval = F (psi)
  retval = 4*abs(psi).^2.*psi-abs(psi).^4.*psi;
end;

mm=5;    %% Mass square
lgth=20; %% Length
c=1;     %% Speed of light
cc=c.^2;

dx=lgth/(2*N); ddx=dx^2;
dt=dx.*0.9./c; ddt=dt^2;

%% Init data:
x = (1:2*N)';
X = (1:4:2*N)';
XX = (-2*N:4:2*N)';
XAXIS=[XX.*0;XX.*0;XX];
xaxis=[X,0.*X,0.*X];
psi(x,1)=exp(-2.*(dx.*x-lgth./2.5).^2).*(1-0.4.*I);
psi(x,2)=exp(-2.*(dx.*x-lgth./2.5).^2);


t=0;
step=0;
while(step < T^3+1 ); 
t=t+dt;

string = [x,real(psi(:,2)),imag(psi(:,2))];
r=(0:1)';


%% Klein-Gordon string dynamics:
psi(:,3)=-psi(:,1)+2.*psi(:,2) \
    +ddt.*(cc.*(shift(psi(:,2),-1)+shift(psi(:,2),1)-2.*psi(:,2))./ddx-mm.*psi(:,2));

%% Adding nonlinear terms:
psi(x,3)=psi(x,3)+ddt.*F(psi(x,2));

%% Choose the boundary conditions:
if ( absorption == 1 )
%% Absorbtion by the walls: u_t=u_x, u_t=-u_x
  psi(1,3)=psi(2,3)-dx.*c.*(psi(2,3)-psi(2,2))./dt;
  psi(2.*N,3)=psi(2.*N-1,3)-dx.*c.*(psi(2.*N-1,3)-psi(2.*N-1,2))./dt;
else
  psi(1,3)=0;psi(2*N,3)=0; %% Fixed ends, no stabilization
endif 

if ( step == 1 )
#  gsplot string with lines 3, xaxis with dots 1;
#plot3(psi(:,2),'-b',xaxis(:,1),xaxis(:,2),xaxis(:,3),'-r')
#plot3(psi(:,2),'-b',XAXIS,'-r')
plot3(psi(:,2),'-b',XX,0.*XX,0.*XX,'-r')
#plot3(string(:,1),string(:,2),string(:,3),'-b',xaxis(:,1),xaxis(:,2),xaxis(:,3),'-r')
print('nlkg-0.eps','-deps');
endif

if ( step == T )
hold off;
#  gsplot string with lines 3, xaxis with dots 1;
plot3(psi(:,2),'-b',XX,0.*XX,0.*XX,'-r')
print('nlkg-1.eps','-deps');
endif

if ( step == T^2 )
#  gsplot string with lines 3, xaxis with dots 1;
hold off;
plot3(psi(:,2),'-b',XX,0.*XX,0.*XX,'-r')
print('nlkg-2.eps','-deps');
endif

if ( step == T^3 )
#  gsplot string with lines 3, xaxis with dots 1;
hold off;
plot3(psi(:,2),'-b',XX,0.*XX,0.*XX,'-r')
print('nlkg-3.eps','-deps');
endif

psi(:,1)=psi(:,2);psi(:,2)=psi(:,3);

step=step+1;  
endwhile;

t

