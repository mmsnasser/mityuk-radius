function [R,m] = Mityuk(et,etp,n,thetak,alpha)
% Mityuk.m
% Nasser June 12, 2019
% Compute Mityuk's radius R(G,alpha) and Mityuk's function m(G,alpha)
% where alpha is a point in G, et, etp: parametrization of the boundary
% and its first derivative, thetk=[theta_1,...,theta_L] are the oblique
% angles of the spirals
for k=1:length(thetak)
    J       = 1+(k-1)*n:k*n;
    A(J,1)  = exp(i.*(pi/2-thetak(k))).*(et(J)-alpha);
    gam(J,1)=imag(exp(-i.*thetak(k)).*clog(et(J)-alpha));
end
[~,h]  =  fbie(et,etp,A,gam,n,5,[],1e-14,100);
h0     =  mean(h(1:n)); R = exp(h0); m = h0/(2*pi);
end