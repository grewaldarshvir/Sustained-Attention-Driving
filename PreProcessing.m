clc
clear all
fileName = 's48_080501n.set';
filePath = 'C:\\Users\\Darshvir\\Desktop\\eeg_dataset\\';
EEG.setname=fileName(1:end-4);
fileName = fileName(1:end-4);
EEG = eeg_checkset( EEG );
EEG = eeg_checkset( EEG );
EEG = eeg_checkset( EEG );
EEG = eeg_checkset( EEG );
% This tracks which version of EEGLAB is being used, you may ignore it
EEG.etc.eeglabvers = '2019.1';
EEG = pop_loadset('filename',strcat(fileName,'.set'),'filepath',filePath);
EEG = eeg_checkset( EEG );
pop_eegplot( EEG, 1, 1, 1); %Plotting Raw EEG Data
EEG = pop_select( EEG, 'nochannel',{'A1' 'A2'});
EEG = eeg_checkset( EEG );
%High Pass Filter
EEG = pop_eegfiltnew(EEG, 'locutoff',0.5,'hicutoff',0,'plotfreqz',1);
EEG = eeg_checkset( EEG );
%Low Pass Filter
EEG = pop_eegfiltnew(EEG, 'locutoff',0,'hicutoff',50,'plotfreqz',1);
EEG = eeg_checkset( EEG );
%Changing Sampling Rate
EEG=pop_resample(EEG,250);
EEG=eeg_checkset( EEG );
%Importing Channel Locations
EEG=pop_chanedit(EEG, 'lookup','C:\\Program Files\\MATLAB\\R2019a\\toolbox\\matlab\\eeglab2019_1\\plugins\\dipfit-3.3\\standard_BESA\\standard-10-5-cap385.elp','eval','chans = pop_chancenter( chans, [],[]);');
EEG = eeg_checkset( EEG );
%Saving Data Set
EEG = pop_saveset( EEG, 'filename',strcat(fileName,'_pre.set'),'filepath',filePath);
EEG = eeg_checkset( EEG );
%Extracting Deviation Onset Epoch
EEG = eeg_checkset( EEG );
EEG = pop_epoch( EEG, {  '251'  '252'  }, [-1  7], 'newname', strcat(fileName,' resampled epochs'), 'epochinfo', 'yes');
EEG = eeg_checkset( EEG );
EEG = pop_rmbase( EEG, [-1000 0] ,[]);
EEG = eeg_checkset( EEG );
EEG = pop_saveset( EEG, 'filename',strcat(fileName,'_dev_on.set'),'filepath',filePath);
clearvars -except filePath fileName;
%Extracting Response Onset Epoch
EEG.etc.eeglabvers = '2019.1';
EEG = pop_loadset('filename',strcat(fileName,'_pre.set'),'filepath',filePath);
EEG = eeg_checkset( EEG );
EEG = pop_epoch( EEG, {  '253'  }, [-2  4], 'newname', strcat(fileName,' resampled epochs'), 'epochinfo', 'yes');
EEG = eeg_checkset( EEG );
EEG = pop_rmbase( EEG, [-2000 0] ,[]);
EEG = eeg_checkset( EEG );
EEG = pop_saveset( EEG, 'filename',strcat(fileName,'_resp_on.set'),'filepath',filePath);
clearvars -except filePath fileName;
%Extracting Response Offset
EEG.etc.eeglabvers = '2019.1';
EEG = pop_loadset('filename',strcat(fileName,'_pre.set'),'filepath',filePath);
EEG = eeg_checkset( EEG );
EEG = pop_epoch( EEG, {  '254'  }, [-2  4], 'newname', strcat(fileName,' resampled epochs'), 'epochinfo', 'yes');
EEG = eeg_checkset( EEG );
EEG = pop_rmbase( EEG, [-2000 0] ,[]);
EEG = eeg_checkset( EEG );
EEG = pop_saveset( EEG, 'filename',strcat(fileName,'_resp_off.set'),'filepath',filePath);
clearvars -except filePath fileName;
%Artifact Removal
EEG = pop_loadset('filename',strcat(fileName,'_dev_on.set'),'filepath',filePath);
pop_eegplot( EEG, 1, 1, 1 );
pause;
fprintf('Press any key to continue\n');
rj_indices = [1:1:EEG.trials];
rj_indices = (rj_indices .* EEG.reject.rejmanual)';
rj_indices = transpose(nonzeros(rj_indices));
EEG = eeg_checkset( EEG );
EEG = pop_select( EEG, 'notrial',rj_indices );
EEG = eeg_checkset( EEG );
%Computing Reaction Time
[m, number_of_events] = size(EEG.event);
counter = 1;
RT_counter = 1;
while(counter <= number_of_events)
    if((EEG.event(counter).type == 251 ||EEG.event(counter).type == 252) && EEG.event(counter+1).type == 253) 
        RT(RT_counter) = EEG.event(counter+1).init_time-EEG.event(counter).init_time;
        epochNumber(RT_counter) = EEG.event(counter).epoch;
        RT_counter = RT_counter+1;
        counter = counter +1;
    else
        counter = counter+1;
    end
end
fileID = fopen(strcat(fileName,'RT.txt'),'w');
fprintf(fileID,'%f \n',RT);
fclose(fileID);
%Running ICA
EEG = eeg_checkset( EEG );
EEG = pop_runica(EEG, 'icatype', 'jader');
EEG = eeg_checkset( EEG );
pop_selectcomps(EEG, [1:31] );
pop_topoplot(EEG, 0, [1:31] ,strcat(fileName,' resampled epochs'),[6 6] ,0,'electrodes','on');
EEG = eeg_checkset( EEG );
EEG = pop_saveset( EEG, 'filename',strcat(fileName,'_dev_on.set'),'filepath',filePath);
EEG = eeg_checkset( EEG );
% Dipole Fitting
brainProcesses = input('Input brain related processes\n');
EEG = eeg_checkset( EEG );
EEG = pop_dipfit_settings( EEG, 'hdmfile','C:\\Program Files\\MATLAB\\R2019a\\toolbox\\matlab\\eeglab2019_1\\plugins\\dipfit-3.3\\standard_BESA\\standard_BESA.mat','coordformat','Spherical','mrifile','C:\\Program Files\\MATLAB\\R2019a\\toolbox\\matlab\\eeglab2019_1\\plugins\\dipfit-3.3\\standard_BESA\\avg152t1.mat','chanfile','C:\\Program Files\\MATLAB\\R2019a\\toolbox\\matlab\\eeglab2019_1\\plugins\\dipfit-3.3\\standard_BESA\\standard-10-5-cap385.elp','chansel', brainProcesses );
EEG = pop_multifit(EEG, brainProcesses ,'threshold',100,'plotopt',{'normlen' 'on'});
EEG = pop_saveset( EEG, 'filename',strcat(fileName,'_dev_on.set'),'filepath',filePath);
EEG = eeg_checkset( EEG );
% Copying Characterstics To Datasets Of Other Epoch Types
icawinv = EEG.icawinv;
icasphere = EEG.icasphere;
icaweights = EEG.icaweights;
icachansind = EEG.icachansind;
dipfit = EEG.dipfit;
clearvars -except fileName filePath icawinv icasphere icaweights icachansind dipfit rj_indices RT; 
% Updating Response Onset Dataset
EEG = pop_loadset('filename',strcat(fileName,'_resp_on.set'),'filepath',filePath);
EEG = eeg_checkset( EEG );
EEG = pop_select( EEG, 'notrial',rj_indices );
EEG = eeg_checkset( EEG );
EEG.icaact = icaweights * icasphere * reshape(EEG.data, size(EEG.data, 1),size(EEG.data, 2) * size(EEG.data, 3));
EEG.icaact = reshape(EEG.icaact, size(EEG.data, 1), size(EEG.data, 2), size(EEG.data, 3));
EEG.icawinv = icawinv;
EEG.icasphere = icasphere;
EEG.icaweights = icaweights;
EEG.icachansind = icachansind;
EEG.dipfit = dipfit;
EEG = pop_saveset( EEG, 'filename',strcat(fileName,'_resp_on.set'),'filepath',filePath);
EEG = eeg_checkset( EEG );
clearvars -except fileName filePath icawinv icasphere icaweights icachansind dipfit rj_indices RT; 
% Updating Response Offset Dataset
EEG = pop_loadset('filename',strcat(fileName,'_resp_off.set'),'filepath',filePath);
EEG = eeg_checkset( EEG );
EEG = pop_select( EEG, 'notrial',rj_indices );
EEG = eeg_checkset( EEG );
EEG.icaact = icaweights * icasphere * reshape(EEG.data, size(EEG.data, 1),size(EEG.data, 2) * size(EEG.data, 3));
EEG.icaact = reshape(EEG.icaact, size(EEG.data, 1), size(EEG.data, 2), size(EEG.data, 3));
EEG.icawinv = icawinv;
EEG.icasphere = icasphere;
EEG.icaweights = icaweights;
EEG.icachansind = icachansind;
EEG.dipfit = dipfit;
EEG = pop_saveset( EEG, 'filename',strcat(fileName,'_resp_off.set'),'filepath',filePath);
EEG = eeg_checkset( EEG );
