function []=colorPlotFSCVwide(xyzmat)
%colorPlotFSCVmat generates a false color plot WITH axis from matlab variable file, then shows the plots

%Code is written by Pumidech Puthongkham.

%Determine the size (matrix dimension) of color plot
[r,c]=size(xyzmat);

%Load conventional false color scheme
load('FSCVmap3.mat')                 


%Calculate colorbar max and min 

maxVal=round(max(max(xyzmat)));     %You can override this by put the number on the RHS instead.
minVal=round(maxVal*-2/3);     %You can override this by put the number on the RHS instead.

% Create axes

figure1=figure('Position',[100 100 600 400]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');
% Set the remaining axes properties
% This works only with holding potential -0.4 V, scan rate 400 V/s, and
% 10-Hz frequency.
set(axes1,'XTick',[1 round(c/2,1) c],'XTickLabel',{'0',num2str(c/20),num2str(c/10)},'YTick',...
[1 round(r/2) r],'YTickLabel',{'-0.4','1.45','-0.4'},...
'FontName','Arial','FontSize',20);
xlabel('Time (s)')
ylabel('E vs. Ag/AgCl (V)')

axis tight

h=surf(xyzmat);
h.LineStyle='none';

colormap(FSCVmap3)
view(0,90)

caxis([minVal maxVal])
c=colorbar;
c.Label.String='Current (nA)';
c.Ticks=[minVal 0 maxVal];
c.FontSize=18;


end