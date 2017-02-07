

% reference: Image Processing Using Pulse-Coupled Neural Networks, Thomas
% Lindblad, Jason M.Kinser



function Y = PCNN_ori(img,iter)
img = im_normalize(img);

sz = size(img);
F = zeros(sz);
L = zeros(sz);
Y = zeros(sz);
Y0 = zeros(sz);
U = zeros(sz);
theta = zeros(sz) + 0.5;

tf = 0.9;
tl = 0.8;
beta = 0.2;

t_theta = 0.8;
t_y = 10;

vf = 2;
vl = 2;

% begin iteration
for i = 1:iter
    work1 = imgaussfilt(Y);  % gauss filt Y, for F
    work2 = imgaussfilt(Y);  % gauss filt Y, for L
    
    F = tf*F + img + vf*work1;
    L = tl*L + vl*work2;
    
    U = F.*(1 + beta*L);
    Y = U > theta;
    Y = double(Y);
    Y0 = Y0+Y;
    theta = t_theta*theta + t_y*Y ;
end
Y = Y0;
end

function out = im_normalize(img)
maxv = max(img(:));
minv = min(img(:));

out = (img-minv)/(maxv-minv);
end



