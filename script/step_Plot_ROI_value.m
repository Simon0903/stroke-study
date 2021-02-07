clc;clear;
scpdir=pwd;
ori='D:/UCL_project/data';
workdir='Stroke_Study';
cd([ori,'/',workdir])

% plot Mean index
ROI_value_plot('ROI_V*_dttp*_to_targ_fa.mat',1,'DTI FA')
ROI_value_plot('ROI_V*_dttp*_to_targ_md.mat',1,'DTI MD')
ROI_value_plot('ROI_V*_dttp*_to_targ_ad.mat',1,'DTI AD')
ROI_value_plot('ROI_V*_dttp*_to_targ_rd.mat',1,'DTI RD')
ROI_value_plot('ROI_V*_co_dki_ak_to_targ.mat',1,'DKI AK')
ROI_value_plot('ROI_V*_co_dki_mk_to_targ.mat',1,'DKI MK')
ROI_value_plot('ROI_V*_co_dki_rk_to_targ.mat',1,'DKI RK')
ROI_value_plot('ROI_V*_co_FIT_ICVF_to_targ.mat',1,'NODDI Vic')
ROI_value_plot('ROI_V*_co_FIT_ISOVF_to_targ.mat',1,'NODDI Viso')
ROI_value_plot('ROI_V*_co_FIT_OD_to_targ.mat',1,'NODDI ODI')
ROI_value_plot('ROI_V*_co_WMTI_AWF_to_targ.mat',1,'WMTI AWF')
ROI_value_plot('ROI_V*_co_WMTI_Da_to_targ.mat',1,'WMTI Daxon')
ROI_value_plot('ROI_V*_co_WMTI_Dea_to_targ.mat',1,'WMTI De axial')
ROI_value_plot('ROI_V*_co_WMTI_Der_to_targ.mat',1,'WMTI De radial')
ROI_value_plot('ROI_V*_co_WMTI_TORT_to_targ.mat',1,'WMTI Tortuosity')
% plot Percentile 10 index
ROI_value_plot('ROI_V*_dttp*_to_targ_fa.mat',2,'DTI FA')
ROI_value_plot('ROI_V*_dttp*_to_targ_md.mat',2,'DTI MD')
ROI_value_plot('ROI_V*_dttp*_to_targ_ad.mat',2,'DTI AD')
ROI_value_plot('ROI_V*_dttp*_to_targ_rd.mat',2,'DTI RD')
ROI_value_plot('ROI_V*_co_dki_ak_to_targ.mat',2,'DKI AK')
ROI_value_plot('ROI_V*_co_dki_mk_to_targ.mat',2,'DKI MK')
ROI_value_plot('ROI_V*_co_dki_rk_to_targ.mat',2,'DKI RK')
ROI_value_plot('ROI_V*_co_FIT_ICVF_to_targ.mat',2,'NODDI Vic')
ROI_value_plot('ROI_V*_co_FIT_ISOVF_to_targ.mat',2,'NODDI Viso')
ROI_value_plot('ROI_V*_co_FIT_OD_to_targ.mat',2,'NODDI ODI')
ROI_value_plot('ROI_V*_co_WMTI_AWF_to_targ.mat',2,'WMTI AWF')
ROI_value_plot('ROI_V*_co_WMTI_Da_to_targ.mat',2,'WMTI Daxon')
ROI_value_plot('ROI_V*_co_WMTI_Dea_to_targ.mat',2,'WMTI De axial')
ROI_value_plot('ROI_V*_co_WMTI_Der_to_targ.mat',2,'WMTI De radial')
ROI_value_plot('ROI_V*_co_WMTI_TORT_to_targ.mat',2,'WMTI Tortuosity')
% plot Median index
ROI_value_plot('ROI_V*_dttp*_to_targ_fa.mat',3,'DTI FA')
ROI_value_plot('ROI_V*_dttp*_to_targ_md.mat',3,'DTI MD')
ROI_value_plot('ROI_V*_dttp*_to_targ_ad.mat',3,'DTI AD')
ROI_value_plot('ROI_V*_dttp*_to_targ_rd.mat',3,'DTI RD')
ROI_value_plot('ROI_V*_co_dki_ak_to_targ.mat',3,'DKI AK')
ROI_value_plot('ROI_V*_co_dki_mk_to_targ.mat',3,'DKI MK')
ROI_value_plot('ROI_V*_co_dki_rk_to_targ.mat',3,'DKI RK')
ROI_value_plot('ROI_V*_co_FIT_ICVF_to_targ.mat',3,'NODDI Vic')
ROI_value_plot('ROI_V*_co_FIT_ISOVF_to_targ.mat',3,'NODDI Viso')
ROI_value_plot('ROI_V*_co_FIT_OD_to_targ.mat',3,'NODDI ODI')
ROI_value_plot('ROI_V*_co_WMTI_AWF_to_targ.mat',3,'WMTI AWF')
ROI_value_plot('ROI_V*_co_WMTI_Da_to_targ.mat',3,'WMTI Daxon')
ROI_value_plot('ROI_V*_co_WMTI_Dea_to_targ.mat',3,'WMTI De axial')
ROI_value_plot('ROI_V*_co_WMTI_Der_to_targ.mat',3,'WMTI De radial')
ROI_value_plot('ROI_V*_co_WMTI_TORT_to_targ.mat',3,'WMTI Tortuosity')
% plot Percentile 90 index
ROI_value_plot('ROI_V*_dttp*_to_targ_fa.mat',4,'DTI FA')
ROI_value_plot('ROI_V*_dttp*_to_targ_md.mat',4,'DTI MD')
ROI_value_plot('ROI_V*_dttp*_to_targ_ad.mat',4,'DTI AD')
ROI_value_plot('ROI_V*_dttp*_to_targ_rd.mat',4,'DTI RD')
ROI_value_plot('ROI_V*_co_dki_ak_to_targ.mat',4,'DKI AK')
ROI_value_plot('ROI_V*_co_dki_mk_to_targ.mat',4,'DKI MK')
ROI_value_plot('ROI_V*_co_dki_rk_to_targ.mat',4,'DKI RK')
ROI_value_plot('ROI_V*_co_FIT_ICVF_to_targ.mat',4,'NODDI Vic')
ROI_value_plot('ROI_V*_co_FIT_ISOVF_to_targ.mat',4,'NODDI Viso')
ROI_value_plot('ROI_V*_co_FIT_OD_to_targ.mat',4,'NODDI ODI')
ROI_value_plot('ROI_V*_co_WMTI_AWF_to_targ.mat',4,'WMTI AWF')
ROI_value_plot('ROI_V*_co_WMTI_Da_to_targ.mat',4,'WMTI Daxon')
ROI_value_plot('ROI_V*_co_WMTI_Dea_to_targ.mat',4,'WMTI De axial')
ROI_value_plot('ROI_V*_co_WMTI_Der_to_targ.mat',4,'WMTI De radial')
ROI_value_plot('ROI_V*_co_WMTI_TORT_to_targ.mat',4,'WMTI Tortuosity')
cd(scpdir)
%% ROI_value_plot
function ROI_value_plot(filename,number,output)
% number: 1=mean, 2=std
set(0,'DefaultFigureVisible', 'off')
%set(0,'DefaultFigureVisible', 'on')
figure
file = dir(filename);
% stack data
for i=1:3
    load(file(i).name)
    y(:,i) = ROItemp(:,number);
end

% remove outlier
threshold=prctile(y(:),50)+10*(prctile(y(:),90)-prctile(y(:),50));
[outx,outy]=find(y>threshold);
if isempty(outx)
else
    y(outx(:),:)=[];
end

threshold=prctile(y(:),50)-10*(prctile(y(:),50)-prctile(y(:),10));
[outx,outy]=find(y<threshold);
if isempty(outx)
else
    y(outx(:),:)=[];
end

% set time point
x=[1 2 3];

% plot line foe each period

for j=1:size(y,1)
    plot(x,y(j,:), 'ok-', 'linewidth', 1.1, 'markerfacecolor', [36, 169, 225]/255)
    hold on
end
% plot significant
h=zeros(3,1);
p=zeros(3,1);
for k=1:2
    [h(k),p(k)] = ttest(y(:,k),y(:,k+1));
    hold on
end
[h(3),p(3)] = ttest(y(:,1),y(:,3));


if h(1)==1 & p(1)<0.001
    text(1.465,prctile(y(:),50)+3.63*(prctile(y(:),90)-prctile(y(:),50)),['***'],'fontsize', 16, 'fontname', 'times')
    text(0.96,prctile(y(:),50)+3.6*(prctile(y(:),90)-prctile(y(:),50)),'┌─────────┐','fontsize', 16, 'fontname', 'times')
    text(1.365,prctile(y(:),50)+3.38*(prctile(y(:),90)-prctile(y(:),50)),['p = ',num2str(p(1))],'fontsize', 10, 'fontname', 'times')
elseif h(1)==1 & p(1)<0.01
    text(1.465,prctile(y(:),50)+3.63*(prctile(y(:),90)-prctile(y(:),50)),['**'],'fontsize', 16, 'fontname', 'times')
    text(0.96,prctile(y(:),50)+3.6*(prctile(y(:),90)-prctile(y(:),50)),'┌─────────┐','fontsize', 16, 'fontname', 'times')
    text(1.365,prctile(y(:),50)+3.38*(prctile(y(:),90)-prctile(y(:),50)),['p = ',num2str(p(1))],'fontsize', 10, 'fontname', 'times')
elseif h(1)==1 & p(1)<0.05
    text(1.465,prctile(y(:),50)+3.63*(prctile(y(:),90)-prctile(y(:),50)),['*'],'fontsize', 16, 'fontname', 'times')
    text(0.96,prctile(y(:),50)+3.6*(prctile(y(:),90)-prctile(y(:),50)),'┌─────────┐','fontsize', 16, 'fontname', 'times')
    text(1.365,prctile(y(:),50)+3.38*(prctile(y(:),90)-prctile(y(:),50)),['p = ',num2str(p(1))],'fontsize', 10, 'fontname', 'times')
end


if h(1)==1 & p(2)<0.001
    text(2.465,prctile(y(:),50)+3.63*(prctile(y(:),90)-prctile(y(:),50)),['***'],'fontsize', 16, 'fontname', 'times')
    text(1.969,prctile(y(:),50)+3.6*(prctile(y(:),90)-prctile(y(:),50)),'┌─────────┐','fontsize', 16, 'fontname', 'times')
    text(2.365,prctile(y(:),50)+3.38*(prctile(y(:),90)-prctile(y(:),50)),['p = ',num2str(p(2))],'fontsize', 10, 'fontname', 'times')
elseif h(1)==1 & p(2)<0.01
    text(2.465,prctile(y(:),50)+3.63*(prctile(y(:),90)-prctile(y(:),50)),['**'],'fontsize', 16, 'fontname', 'times')
    text(1.969,prctile(y(:),50)+3.6*(prctile(y(:),90)-prctile(y(:),50)),'┌─────────┐','fontsize', 16, 'fontname', 'times')
    text(2.365,prctile(y(:),50)+3.38*(prctile(y(:),90)-prctile(y(:),50)),['p = ',num2str(p(2))],'fontsize', 10, 'fontname', 'times')
elseif h(2)==1 & p(2)<0.05
    text(2.465,prctile(y(:),50)+3.63*(prctile(y(:),90)-prctile(y(:),50)),['*'],'fontsize', 16, 'fontname', 'times')
    text(1.969,prctile(y(:),50)+3.6*(prctile(y(:),90)-prctile(y(:),50)),'┌─────────┐','fontsize', 16, 'fontname', 'times')
    text(2.365,prctile(y(:),50)+3.38*(prctile(y(:),90)-prctile(y(:),50)),['p = ',num2str(p(2))],'fontsize', 10, 'fontname', 'times')
end

if h(1)==1 & p(3)<0.001
    text(1.965,prctile(y(:),50)+3.85*(prctile(y(:),90)-prctile(y(:),50)),['***'],'fontsize', 16, 'fontname', 'times')
    text(0.999,prctile(y(:),50)+3.82*(prctile(y(:),90)-prctile(y(:),50)),'┌────────────────────┐','fontsize', 15, 'fontname', 'times')
    text(2.065,prctile(y(:),50)+4.25*(prctile(y(:),90)-prctile(y(:),50)),['p = ',num2str(p(3))],'fontsize', 10, 'fontname', 'times')
elseif h(1)==1 & p(3)<0.01
    text(1.965,prctile(y(:),50)+3.85*(prctile(y(:),90)-prctile(y(:),50)),['**'],'fontsize', 16, 'fontname', 'times')
    text(0.999,prctile(y(:),50)+3.82*(prctile(y(:),90)-prctile(y(:),50)),'┌────────────────────┐','fontsize', 15, 'fontname', 'times')
    text(2.065,prctile(y(:),50)+4.25*(prctile(y(:),90)-prctile(y(:),50)),['p = ',num2str(p(3))],'fontsize', 10, 'fontname', 'times')
elseif h(3)==1 & p(3)<0.05
    text(1.965,prctile(y(:),50)+3.85*(prctile(y(:),90)-prctile(y(:),50)),['*'],'fontsize', 16, 'fontname', 'times')
    text(0.999,prctile(y(:),50)+3.82*(prctile(y(:),90)-prctile(y(:),50)),'┌────────────────────┐','fontsize', 15, 'fontname', 'times')
    text(2.065,prctile(y(:),50)+4.25*(prctile(y(:),90)-prctile(y(:),50)),['p = ',num2str(p(3))],'fontsize', 10, 'fontname', 'times')
end
% set figure parameter
xlim([0 4]);
ylim([prctile(y(:),50)-5*(prctile(y(:),50)-prctile(y(:),5)) prctile(y(:),50)+4.5*(prctile(y(:),90)-prctile(y(:),50))]);
grid on;
set(gca, 'linewidth', 1.1, 'fontsize', 16, 'fontname', 'times')
xlabel('Time')
xticks([1 2 3])
xticklabels({'1 week','2 weeks','3 months'})
switch output
    case {'DTI MD','DTI AD','DTI RD'}
        ylabel('10^-^3 mm^2/s')
end
switch number
    case 1
        extracted='Mean ';
    case 2  
        extracted='Percentile 10 ';
    case 3  
        extracted='Median ';
    case 4  
        extracted='Percentile 90 ';
end
title([extracted,output]);
set(gcf,'position',[0,0,800,500])
saveas(gcf,[extracted,output,'.png'])
end