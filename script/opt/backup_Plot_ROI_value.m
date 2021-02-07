clc;clear;
ori='D:/UCL_project/data';
workdir='Stroke_Study';
cd([ori,'/',workdir])

% plot index
% ROI_value_plot('ROI_V*_dttp*_to_targ_fa.mat',1,'DTI FA')
% ROI_value_plot('ROI_V*_dttp*_to_targ_md.mat',1,'DTI MD')
% ROI_value_plot('ROI_V*_dttp*_to_targ_ad.mat',1,'DTI AD')
% ROI_value_plot('ROI_V*_dttp*_to_targ_rd.mat',1,'DTI RD')
% ROI_value_plot('ROI_V*_co_dki_ak_to_targ.mat',1,'DKI AK')
% ROI_value_plot('ROI_V*_co_dki_mk_to_targ.mat',1,'DKI MK')
% ROI_value_plot('ROI_V*_co_dki_rk_to_targ.mat',1,'DKI RK')
% ROI_value_plot('ROI_V*_co_FIT_ICVF_to_targ.mat',1,'NODDI Vic')
% ROI_value_plot('ROI_V*_co_FIT_ISOVF_to_targ.mat',1,'NODDI Viso')
% ROI_value_plot('ROI_V*_co_FIT_OD_to_targ.mat',1,'NODDI ODI')
% ROI_value_plot('ROI_V*_co_WMTI_AWF_to_targ.mat',1,'WMTI AWF')
% ROI_value_plot('ROI_V*_co_WMTI_Da_to_targ.mat',1,'WMTI Da')
% ROI_value_plot('ROI_V*_co_WMTI_Dea_to_targ.mat',1,'WMTI Dea')
% ROI_value_plot('ROI_V*_co_WMTI_Der_to_targ.mat',1,'WMTI Der')
ROI_value_plot('ROI_V*_co_WMTI_TORT_to_targ.mat',1,'WMTI TORT')


%% ROI_value_plot
function ROI_value_plot(filename,number,output)
% number: 1=mean, 2=std
set(0,'DefaultFigureVisible', 'off')
figure
file = dir(filename);
% combinematrix=zeros(36,2);
% for i=1:3
%     load(file(i).name)
%     combinematrix(12*i-11:12*i,1) = ROItemp(:,number);
%     combinematrix(12*i-11:12*i,2) = i;
% end
for i=1:3
    load(file(i).name)
    y(:,i) = ROItemp(:,number);
end
x=[1 2 3];
% x = combinematrix(:,2);
% y = combinematrix(:,1);
% plot(x,y, 'ok', 'linewidth', 1.1, 'markerfacecolor', [36, 169, 225]/255)
% hold on
% for i=1:size(ROItemp,1)
%     line([combinematrix(i,2) combinematrix(i,1)],[combinematrix(size(ROItemp,1)+i,2) combinematrix(size(ROItemp,1)+i,1)])
%     line([combinematrix(size(ROItemp,1)+i,2) combinematrix(size(ROItemp,1)+i,1)],[combinematrix(2*size(ROItemp,1)+i,2) combinematrix(2*size(ROItemp,1)+i,1)])
%     hold on
% end
for j=1:2
    plot(x,y(j,:), 'ok-', 'linewidth', 1.1, 'markerfacecolor', [36, 169, 225]/255)
    hold on
end

for j=4:size(ROItemp,1)
    plot(x,y(j,:), 'ok-', 'linewidth', 1.1, 'markerfacecolor', [36, 169, 225]/255)
    hold on
end

% Fitting
% p = polyfit(x,y,1);
% plot(x,polyval(p, x),'k-', 'linewidth', 1.1, 'markerfacecolor', [29, 191, 151]/255)

xlim([0 4]);
grid on;
set(gca, 'linewidth', 1.1, 'fontsize', 16, 'fontname', 'times')
xlabel('Time')
xticks([1 2 3])
xticklabels({'Time point 1','Time point 2','Time point 3'})
%ylabel()
title(output);
%legend('Patients', ['y = ',num2str(p(1)),'x + ',num2str(p(2))])
set(gcf,'position',[0,0,800,500])
saveas(gcf,[output,'.png'])
end