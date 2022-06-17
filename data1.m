
%% CODE FOR BATCH PROCESSING CFD FILES
% no need to edit!
% Simple ensure that its placed in folder containing the CFD files with the
% file naming convention CFDD800NLDS2_FIN-

function [Pressure, DPressure, Y_COORD, timestep]= data1(time)
%%Required time step
%Time in seconds 

% Variable Intilization
filename_default='CFDD800NLDS2_FIN-';     %default file name
timestep=time*100;                        %Generate timestep for file name 
file_index=sprintf('%04d', timestep);  %file Index for appending
% Pressure=zeros();                      % pressure array init
% DPressure=zeros();                     % Dynamic pressure array init 
% Y_COORD=zeros();                       % Intialize H values for  


%% Create filename and Read the required data
  
    filename = strcat(filename_default, file_index);
    delimiter = ' ';
    startRow = 2;
    formatSpec = '%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';
    fileID = fopen(filename,'r');
    dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'TextType', 'string', 'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
    fclose(fileID);
    
 %%Create and specify table for data storage
    B2 = table(dataArray{1:end-1}, 'VariableNames', {'nodenumber','xcoordinate','ycoordinate','pressure','pressurecoefficient','dynamicpressure','absolutepressure','totalpressure','reltotalpressure','velocitymagnitude','xvelocity','yvelocity','streamfunction','meshxvelocity','meshyvelocity'});
    clearvars filename delimiter startRow formatSpec fileID dataArray ans;
    
 %Get_data from the file
Pressure=B2.pressure;
DPressure=B2.dynamicpressure;
Y_COORD=B2.ycoordinate;

return

 %(c) Allan kasedde (2019-2022 Vers-062022.1)
