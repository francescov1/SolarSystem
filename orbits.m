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
mU = 86.8*10^24; % uranus
mN = 102*10^24; % neptune
mP = 0.0146*10^24; % pluto
mMoon = 0.073*10^(24); % moon

%% Initial veloctiy and positions
%1 au= 149597870.700 km;
% v = au/day
% r = au
% positions and velocities relative to sun on January 1st 2017 at 00:00

r_Me = [-1.433719457930228E-01,2.837093715285307E-01,3.633570612044031E-02] * 149597870700; % [m]
v_Me = [-3.076848842366683E-02,-1.162353364156454E-02,1.872970822663991E-03] * 149597870700/(24*60*60);
r_V = [4.673243997906552E-01  5.508231287051383E-01 -1.941467305848078E-02] * 149597870700;
v_V = [-1.548526759260772E-02  1.299852601837024E-02  1.071832461568199E-03] * 149597870700/(24*60*60);
r_E = [-1.796136519182077E-01  9.667949205028737E-01 -3.668730384613077E-05] * 149597870700;
v_E = [-1.720038360546182E-02 -3.211186215649903E-03  7.927770738232715E-07] * 149597870700/(24*60*60);
r_Ma = [1.354702870090992,3.868749030255172E-01,-2.514009726245983E-02] * 149597870700;
v_Ma = [-3.307029671743305E-03,1.465320120239402E-02,3.882285860373254E-04] * 149597870700/(24*60*60);
r_J = [-5.359733624674655E+00 -1.012671050217713E+00  1.241359522035637E-01] * 149597870700;
v_J = [1.311702886873301E-03 -7.065278150493061E-03 -1.624163739653627E-09] * 149597870700/(24*60*60);
r_S = [-1.868495879646128E+00 -9.869704547613226E+00  2.459234992440213E-01] * 149597870700;
v_S = [5.177713288560582E-03 -1.060858809497183E-03 -1.875445592488674E-04] * 149597870700/(24*60*60);

%Closer few with first 6 planets

% r_U = [1.833923817235877E+01  7.826215795254697E+00 -2.083948308557899E-01] * 149597870700; 
% v_U = [-1.570450355284046E-03  3.427252440667500E-03  3.293836734274746E-05] * 149597870700/(24*60*60);
% r_N = [2.833608216016369E+01 -9.693418553032648E+00 -4.534188026706456E-01] * 149597870700;
% v_N = [9.977607029958199E-04  2.982455307744095E-03 -8.470282162570256E-05] * 149597870700/(24*60*60);
% r_P = [9.660084390442071E+00 -3.180258639627286E+01  6.075583526886171E-01] * 149597870700;
% v_P = [3.071275736267501E-03  2.467054753549366E-04 -9.274775434368603E-04] * 149597870700/(24*60*60);
%r_Moon = [-1.778781359470345E-01  9.648400196437807E-01  5.354292725033137E-05] * 149597870700;
%v_Moon = [-1.678078369242432E-02 -2.810934308980432E-03 -4.769788550263151E-05] * 149597870700/(24*60*60);

%% Plotting planets and animated lines
i = 1; %day counter
col={[0.5 0.5 0.5],'g','b','r','r','g','b','b','c'}; % colors
sz=log([485 1200 1200 679 14298 12054 5112 4950 237]./0.0001); % sizes
figure(1)
Sun = plot3(0,0,0,'.','color',[1 0.5 0.2],'markersize',3*sz(1));
hold on
Me = plot3(r_Me(1),r_Me(2),r_Me(3),'.','color',col{1},'markersize',sz(1));
MeL = animatedline(r_Me(1),r_Me(2),r_Me(3),'color',col{1});
V = plot3(r_V(1),r_V(2),r_V(3),'.','color',col{2},'markersize',sz(2));
VL = animatedline(r_V(1),r_V(2),r_V(3),'color',col{2});
E = plot3(r_E(1),r_E(2),r_E(3),'.','color',col{3},'markersize',sz(3));
EL = animatedline(r_E(1),r_E(2),r_E(3),'color',col{3});
Ma = plot3(r_Ma(1),r_Ma(2),r_Ma(3),'.','color',col{4},'markersize',sz(4));
MaL = animatedline(r_Ma(1),r_Ma(2),r_Ma(3),'color',col{4});
J = plot3(r_J(1),r_J(2),r_J(3),'.','color',col{5},'markersize',sz(5));
JL = animatedline(r_J(1),r_J(2),r_J(3),'color',col{5});
S = plot3(r_S(1),r_S(2),r_S(3),'.','color',col{6},'markersize',sz(6));
SL = animatedline(r_S(1),r_S(2),r_S(3),'color',col{6});

% U = plot3(r_U(1),r_U(2),r_U(3),'.','color',col{7},'markersize',sz(7));
% UL = animatedline(r_Me(1),r_Me(2),r_Me(3));
% N = plot3(r_N(1),r_N(2),r_N(3),'.','color',col{8},'markersize',sz(8));
% NL = animatedline(r_Me(1),r_Me(2),r_Me(3));
% P = plot3(r_P(1),r_P(2),r_P(3),'.','color',col{9},'markersize',sz(9));
% PL = animatedline(r_Me(1),r_Me(2),r_Me(3));
%Moon = plot3(r_Moon(1),r_Moon(2),r_Moon(3),'.','color','black','markersize',sz(9)/2);

hold off
axis manual
axis([-100e10,100e10,-100e10,100e10,-100e10,100e10])
while i <= 365*100 % looping through 100 years, updated position and velocity data each day
    [r_Me,v_Me] = traj(mMe,r_Me,v_Me);
    [r_V,v_V] = traj(mV,r_V,v_V);
    [r_E,v_E] = traj(mE,r_E,v_E);
    [r_Ma,v_Ma] = traj(mMa,r_Ma,v_Ma);
    [r_J,v_J] = traj(mJ,r_J,v_J);
    [r_S,v_S] = traj(mS,r_S,v_S);
    %[r_U,v_U] = traj(mV,r_U,v_U);
    %[r_N,v_N] = traj(mV,r_N,v_N);
    %[r_P,v_P] = traj(mV,r_P,v_P);

    % updating plot
    Me.XData = r_Me(1);
    Me.YData = r_Me(2);
    Me.ZData = r_Me(3);
    addpoints(MeL,r_Me(1),r_Me(2),r_Me(3));
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
%   U.XData = r_U(1);
%   U.YData = r_U(2);
%   U.ZData = r_U(3);
%   addpoints(UL,r_U(1),r_U(2),r_U(3));
%   N.XData = r_N(1);
%   N.YData = r_N(2);
%   N.ZData = r_N(3);
%   addpoints(NL,r_N(1),r_N(2),r_N(3));
%   P.XData = r_P(1);
%   P.YData = r_P(2);
%   P.ZData = r_P(3);
%   addpoints(PL,r_P(1),r_P(2),r_P(3));
    drawnow
    i = i+1;
end

