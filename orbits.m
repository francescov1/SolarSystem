%% Orbit Function
% A function that uses initial planet properties for the first 6 planets of our solar system to plot 
% and simulate their trajectories over the course of one year
function orbits
%% Mass (Kg)
global mSun G
G = 6.673*10^(-11); % Gravitational constant [NM^2 / kg^2]
mSun = 1.989*10^30; % sun
mMe = 0.33*10^24; % mercury
mV = 4.87*10^24; % venus
mE = 5.97*10^24; % earth
mMa = 0.642*10^24; % mars
mJ = 1898*10^24; % jupiter
mS = 568*10^24; % saturn

%% Initial veloctiy and positions
%1 au = 149597870.700 km;
% positions and velocities relative to sun on January 1st 2017 at 00:00 in
% [m] and [m/s] taken from NASA's website
r_Me = [-1.433719457930228E-01,2.837093715285307E-01,3.633570612044031E-02] * 149597870700; % mercury position
v_Me = [-3.076848842366683E-02,-1.162353364156454E-02,1.872970822663991E-03] * 149597870700/(24*60*60); % mercury velocity
r_V = [4.673243997906552E-01  5.508231287051383E-01 -1.941467305848078E-02] * 149597870700; % venus position
v_V = [-1.548526759260772E-02  1.299852601837024E-02  1.071832461568199E-03] * 149597870700/(24*60*60); % venus velocity
r_E = [-1.796136519182077E-01  9.667949205028737E-01 -3.668730384613077E-05] * 149597870700; % earth position
v_E = [-1.720038360546182E-02 -3.211186215649903E-03  7.927770738232715E-07] * 149597870700/(24*60*60); % earth velocity
r_Ma = [1.354702870090992,3.868749030255172E-01,-2.514009726245983E-02] * 149597870700; % mars position
v_Ma = [-3.307029671743305E-03,1.465320120239402E-02,3.882285860373254E-04] * 149597870700/(24*60*60); % mars velocity
r_J = [-5.359733624674655E+00 -1.012671050217713E+00  1.241359522035637E-01] * 149597870700; % jupiter position
v_J = [1.311702886873301E-03 -7.065278150493061E-03 -1.624163739653627E-09] * 149597870700/(24*60*60); % jupiter velocity
r_S = [-1.868495879646128E+00 -9.869704547613226E+00  2.459234992440213E-01] * 149597870700; % saturn position
v_S = [5.177713288560582E-03 -1.060858809497183E-03 -1.875445592488674E-04] * 149597870700/(24*60*60); % saturn velocity

%% Plotting planets and animated lines
sz=log([2440 6052 6371 3390 69911 58232]./0.01); % planet radii in order, and scaled to use as marker sizes
figure(1)
Sun = plot3(0,0,0,'.','color',[1 0.5 0.2],'markersize',2.5*sz(1));
hold on
%Me = plot3(r_Me(1),r_Me(2),r_Me(3),'.','color',[0.5 0.5 0.5],'markersize',sz(1)); % plot mercury on figure
%MeL = animatedline(r_Me(1),r_Me(2),r_Me(3),'color',[0.5 0.5 0.5]); % plot mercury's path on figure
V = plot3(r_V(1),r_V(2),r_V(3),'.','color','g','markersize',sz(2)); % plot venus on figure
VL = animatedline(r_V(1),r_V(2),r_V(3),'color','g'); % plot venus's path on figure
E = plot3(r_E(1),r_E(2),r_E(3),'.','color','b','markersize',sz(3)); % plot earth on figure
EL = animatedline(r_E(1),r_E(2),r_E(3),'color','b'); % plot earths's path on figure
Ma = plot3(r_Ma(1),r_Ma(2),r_Ma(3),'.','color','r','markersize',sz(4)); % plot mars on figure
MaL = animatedline(r_Ma(1),r_Ma(2),r_Ma(3),'color','r'); % plot mars' path on figure
J = plot3(r_J(1),r_J(2),r_J(3),'.','color','r','markersize',sz(5)); % plot jupiter on figure
JL = animatedline(r_J(1),r_J(2),r_J(3),'color','r'); % plot jupiter's path on figure
S = plot3(r_S(1),r_S(2),r_S(3),'.','color','g','markersize',sz(6)); % plot saturn on figure
SL = animatedline(r_S(1),r_S(2),r_S(3),'color','g'); % plot saturn's path on figure

% plot saturn's ring
angle=0:0.5:2.1*pi; 
xring = 50300000 * cos(angle) + r_S(1);
yring = 50300000 * sin(angle) + r_S(2);
zring = ones(1,length(xring))*r_S(3);
ring = plot3(xring,yring,zring,'LineWidth',1,'color',[0.4,0.4,0.4]);
hold off
axis manual
axis([-160e10,160e10,-160e10,160e10,-160e10,160e10])
for i = 1:365 % looping through 1 year, updating position and velocity data each day
    %[r_Me,v_Me] = traj(mMe,r_Me,v_Me);
    [r_V,v_V] = traj(mV,r_V,v_V);
    [r_E,v_E] = traj(mE,r_E,v_E);
    [r_Ma,v_Ma] = traj(mMa,r_Ma,v_Ma);
    [r_J,v_J] = traj(mJ,r_J,v_J);
    [r_S,v_S] = traj(mS,r_S,v_S);
    
    % updating plot
    %Me.XData = r_Me(1);
    %Me.YData = r_Me(2);
    %Me.ZData = r_Me(3);
    %addpoints(MeL,r_Me(1),r_Me(2),r_Me(3));
    V.XData = r_V(1);
    V.YData = r_V(2);
    V.ZData = r_V(3);
    addpoints(VL,r_V(1),r_V(2),r_V(3));
    E.XData = r_E(1);
    E.YData = r_E(2);
    E.ZData = r_E(3);
    addpoints(EL,r_E(1),r_E(2),r_E(3));
    Ma.XData = r_Ma(1);
    Ma.YData = r_Ma(2);
    Ma.ZData = r_Ma(3);
    addpoints(MaL,r_Ma(1),r_Ma(2),r_Ma(3));
    J.XData = r_J(1);
    J.YData = r_J(2);
    J.ZData = r_J(3);
    addpoints(JL,r_J(1),r_J(2),r_J(3));
    S.XData = r_S(1);
    S.YData = r_S(2);
    S.ZData = r_S(3);
    addpoints(SL,r_S(1),r_S(2),r_S(3));
    ring.XData = 50300000000 * cos(angle) + r_S(1);
    ring.YData = 50300000000 * sin(angle) + r_S(2);
    ring.ZData = ones(1,length(xring))*r_S(3);
    drawnow
end
end
