%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 4 - 256 kHz; 20 kHz - 1.04 MHz; and 1.1 - 14.0 MHz. TNR, RAD 1, and RAD 2 %%%%


%%%%2-dimensional matrix of 256 (logarithmically spaced  frequency channels covering 20 - 1,040 kHz) x 1440 (minutes/day)%%%%%%%%% RAD1
%% covers 1.1 - 13.8 MHz. %%% RAD2
%%  4 - 256 kHz TNR%%%

%%%%%%%%%%%%%%%%%%%%

%% By CRAZY SOUL%%%%

%%%%%%%%%%%%%%%%%%%

%% Download data https://solar-radio.gsfc.nasa.gov/data/wind/rad2/2019/rad2a/

clear all;
clc;
close all;
fclose all;

[file,path,indx] = uigetfile('*.R2');
%uiimport(file);

fid=fopen(file);
data=textscan(fid,'%f');
RAD2=reshape(data{1,1},1441,256)';


[file1,path1,indx1] = uigetfile('*.R1');
%uiimport(file1);
fid=fopen(file1);
data1=textscan(fid,'%f');
RAD1=reshape(data1{1,1},1441,256)';



time=linspace(0,24,length(RAD1));
freq1=linspace(20,1.0360e3,256);
freq2=linspace(1.0750,13.7752,256);

figure(1)
subplot(2,1,1)
imagesc(time,freq2,RAD2);set(gca,'YDir','Normal');title('RAD2')
xlabel('Time (UT (hh))','FontSize',14)
ylabel('Frequency (MHz)','FontSize',14)

subplot(2,1,2)
imagesc(time,freq1,RAD1);set(gca,'YDir','Normal');title('RAD1')
xlabel('Time (UT (hh))','FontSize',14)
ylabel('Frequency (kHz)','FontSize',14)
