function [r_f,v_f] = traj(m,r_i,v_i,r_E,v_E)
global mSun mE G
t = 60*60*24;

% if m == 0.073*10^(24)
%     r_iE = r_i - r_E;
%     r_iS = r_i;
%     v_iS = v_i;
%     rE = sqrt(sum(r_iE.^2));
%     rS = sqrt(sum(r_iS.^2));
%     FE = -(G*mE*m/rE^3).*r_iE; % force of earth on moon and sun on moon
%     FS = -(G*mSun*m/rS^3).*r_iS;
%     aE = FE./m; % acceleration of plane
%     aS = FS./m;
%     a = aE + aS;
%     v_f = v_iS + a.*t;
%     r_f = r_iS + (v_iS.*t + (0.5).*a.*(t.^2));
    r = sqrt(sum(r_i.^2));
    F = -(G*mSun*m/r^3).*r_i; % force of sun on planet
    a = F./m; % acceleration of planet
    v_f = v_i + a.*t; % or integral to find new position after one day??
    r_f = r_i + (v_i.*t + (0.5).*a.*(t.^2));
  
%     add to end of orbits:
%     "%     for j = 1:24
% %         [r_Moon,v_Moon] = trajOther(mMoon,r_Moon,v_Moon,r_E);
% %         Moon.XData = r_Moon(1);
% %         Moon.YData = r_Moon(2);
% %         Moon.ZData = r_Moon(3);
% %         drawnow
% %     end
% "
end

