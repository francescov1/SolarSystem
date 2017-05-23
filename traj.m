%% Tajectory function
% A function that takes mass, position, and velocity of a 
% planet and returns its position and velocity a day later
function [r_f,v_f] = traj(m,r_i,v_i)
global mSun G
t = 60*60*24; % seconds/day
r = sqrt(sum(r_i.^2)); % magnitude of distance from sun to planet
F = -(G*mSun*m/r^3).*r_i*1.06; % force of sun on planet
a = F./m; % acceleration of planet
v_f = v_i + a.*t; % velocity of planet after a day
r_f = r_i + (v_i.*t + (0.5).*a.*(t.^2)); % position of planet after a day
end

