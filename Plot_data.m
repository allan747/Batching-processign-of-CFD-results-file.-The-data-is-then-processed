%% Process the data

% This code is the main function.
% Computes the Pressure, Dynamic pressure, the Y_coord, the timestep
% The timestep is different from the time. Time step  
% [Pressure, DPressure, Y_COORD, timestep]=data1(time(1,1))

%future improvements include blocking out the code

%% 

%enter time Period in seconds

time=[27 28 29 30];


%% ____________No NEED TO EDIT THIS SEGMENT__________________________________
%This Code segment is in Rapid prototype form and hasn't been optimised.
% Beter data recursion and loops can be written
% Better data structures can also still be added.

%Xn is the dynamic pressure
%tn is the is the timestep
%y is the coordinates


[~, x1, ~,t10]=data1(time(1,1));   
[~, x2, ~,t12]=data1(time(1,2));
[~, x3, ~,t13]=data1(time(1,3));
[~, x4, y,t14]=data1(time(1,4));

y=y./max(y);
figure()

a_data=load('EQ_accel.dat');

a10=abs(a_data(t10));
a12=abs(a_data(t12));
a13=abs(a_data(t13));
a14=abs(a_data(t14));

%compute Pressure Coefficient

den10=y.*(10000*a10);
den12=y.*(10000*a12);
den13=y.*(10000*a13);
den14=y.*(10000*a14);

cp10=x1/den10;
cp12=x2/den12;
cp13=x3/den13;
cp14=x4/den14;

%%plot data
h1 = axes;

hold on
p1=plot(cp10,y,'b--');
p2=plot(cp12,y,'r:');
p3=plot(cp13,y,'-.');
p4=plot (cp14,y, 'g-');
xlabel('$Cp = \frac{p}{\alpha_t \times \rho \times h}$','Interpreter','latex');
ylim([0 1]);
xlim([0.001 0.9]);
ylabel('Normalised y/H', 'Interpreter','latex');
set(h1, 'Ydir', 'reverse');
yticks('manual');
yticklabels({'1','0.9','0.8','0.7','0.6','0.5','0.4', '0.3', '0.2', '0.1', '0'});
hleglines = [p1(1) p2(1) p3(1) p4(1)];

%% Change the graph legend text here 

hleg = legend(hleglines,'t=27','t=28','t=29', 't=30');
hold off





%(c)2022 ver 2.1
%This is a revision to the 2022