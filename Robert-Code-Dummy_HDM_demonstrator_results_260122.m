% ### dummy demonstrator test results 26/01/22 ###
clear all
close all

%Chose measurement series and corresponding actuated pixel
nr=5; pix_h = 4; pix_v = 3;
%nr=8; pix_h = 4; pix_v = 2;

M_1 = 1e3*readmatrix(['Final try m' num2str(nr) ' px h' num2str(pix_h) ' v' num2str(pix_v) ' V0.csv'],'Delimiter',',','Range','B109:T127')
M_2 = 1e3*readmatrix(['Final try m' num2str(nr) ' px h' num2str(pix_h) ' v' num2str(pix_v) ' -V900.csv'],'Delimiter',',','Range','B109:T127')
M_3 = 1e3*readmatrix(['Final try m' num2str(nr) ' px h' num2str(pix_h) ' v' num2str(pix_v) ' V0 after.csv'],'Delimiter',',','Range','B109:T127')
M_4 = 1e3*readmatrix(['Final try m' num2str(nr) ' px h' num2str(pix_h) ' v' num2str(pix_v) ' +V900.csv'],'Delimiter',',','Range','B109:T127')
M_5 = 1e3*readmatrix(['Final try m' num2str(nr) ' px h' num2str(pix_h) ' v' num2str(pix_v) ' V0 end.csv'],'Delimiter',',','Range','B109:T127')

Ch_12 = M_2 - M_1;
Ch_13 = M_3 - M_1;
Ch_14 = M_4 - M_1;
Ch_15 = M_5 - M_1;

[r,c] = size(M_1);
[X,Y] = meshgrid(1:1:c,1:1:r);
Az = 90; El = 0;
%Az = 45; El = 30;

subplot(1,4,1)
surf(X,Y,Ch_12)
zlim([-500,500])
title('Shape change @ -900V')
view(Az,El)

subplot(1,4,2)
surf(X,Y,Ch_13)
zlim([-500,500])
title('Shape change @ 0V (after -900V)')
view(Az,El)

subplot(1,4,3)
surf(X,Y,Ch_14)
zlim([-500,500])
title('Shape change @ +900V')
view(Az,El)

subplot(1,4,4)
surf(X,Y,Ch_15)
zlim([-500,500])
title('Shape change @ 0V (after +900V)')
view(Az,El)

suptitle(['Measurement series ' num2str(nr) '  pixel h' num2str(pix_h) ' v' num2str(pix_v)])





%% Save these values after first series if you want to compare series for repro

Ch_12_1 = Ch_12;
Ch_13_1 = Ch_13;
Ch_14_1 = Ch_14;
Ch_15_1 = Ch_15;

%%
dCh_12 = Ch_12_1 -Ch_12;
dCh_13 = Ch_13_1 -Ch_13;
dCh_14 = Ch_14_1 -Ch_14;
dCh_15 = Ch_15_1 -Ch_15;

% Repro when repeating a meas series
subplot(1,4,1)
surf(X,Y,dCh_12)
zlim([-500,500])
title('Difference in shape change @ -900V')
view(Az,El)

subplot(1,4,2)
surf(X,Y,dCh_13)
zlim([-500,500])
title('Difference in shape change @ 0V (after -900V)')
view(Az,El)

subplot(1,4,3)
surf(X,Y,dCh_14)
zlim([-500,500])
title('Difference in shape change @ +900V')
view(Az,El)

subplot(1,4,4)
surf(X,Y,dCh_15)
zlim([-500,500])
title('Difference in shape change @ 0V (after +900V)')
view(Az,El)

suptitle(['Repro measurement series'  '  pixel h' num2str(pix_h) ' v' num2str(pix_v)])






    
