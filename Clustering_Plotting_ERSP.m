clc
clear all
filePath = 'C:\\Users\\Darshvir\\Desktop\\eeg_dataset\\';
SET = { %Set Name, Component
    's01_051017m_dev_on.set',[3 6 8 11 13 19 20 23 25 27 28 30 31];
    's02_050921m_dev_on.set',[5 7 8 11 12 16 17 19 21 22 28 29 30];
    's04_051130m_dev_on.set',[2 4 6 8 10 12 14 15 16 17 18 21 23 26 31];
    's06_051119m_dev_on.set',[5 7 10 12 15 19 30];
    's09_060313n_dev_on.set',[3 5 6 9 10 11 13 14 19 22 24 25 26 28];
    's11_060920_1n_dev_on.set',[2 4 6 7 8 10 12 13 16 17 22 23 30];
    's12_060710_1m_dev_on.set',[2 5 6 9 11 12 15 17 20 22 28 31];
    's13_060217m_dev_on.set',[2 4 5 7 14 15 18 22 24 25 26];
    's14_060319m_dev_on.set',[4 5 8 9 18 20 23 24 29];
    's22_080513m_dev_on.set',[3 4 11 12 14 16 17 18 19 20 21 23 26 31];
    's23_060711_1m_dev_on.set',[2 5 6 8 10 13 16 18 21 22 23 25 29 30];
    's31_061020m_dev_on.set',[4 5 9 12 14 19 23 25 27 30 31];
    's35_070115m_dev_on.set',[3 4 6 7 10 11 13 15 17 18 21 22 24 27];
    's48_080501n_dev_on.set',[2 3 5 6 7 9 10 11 12 13 15 16 17 20 22 24 25 29]
    };
Cls2 = { %Set Name,Component
    's01_051017m_dev_on.set',[8];
    's02_050921m_dev_on.set',[8 12];
    's04_051130m_dev_on.set',[4 23];
    's06_051119m_dev_on.set',[7];
    's09_060313n_dev_on.set',[5 6 9];
    's11_060920_1n_dev_on.set',[30];
    's12_060710_1m_dev_on.set',[5 6];
%     's13_060217m_dev_on.set',[];
%     's14_060319m_dev_on.set',[];
    's22_080513m_dev_on.set',[17];
    's23_060711_1m_dev_on.set',[8 22];
    's31_061020m_dev_on.set',[25];
    's35_070115m_dev_on.set',[24];
    's48_080501n_dev_on.set',[9];
    };
Cls3 = { %Set Name,Component
    's01_051017m_dev_on.set',[27 30 31];
%     's02_050921m_dev_on.set',[];
    's04_051130m_dev_on.set',[21];
    's06_051119m_dev_on.set',[19 30];
    's09_060313n_dev_on.set',[11 13 19];
%     's11_060920_1n_dev_on.set',[4];
    's12_060710_1m_dev_on.set',[];
    's13_060217m_dev_on.set',[5 24];
    's14_060319m_dev_on.set',[4];
    's22_080513m_dev_on.set',[26];
    's23_060711_1m_dev_on.set',[5 6];
    's31_061020m_dev_on.set',[12];
    's35_070115m_dev_on.set',[3 15 18];
    's48_080501n_dev_on.set',[5 6 15 24];
    };
Cls5 = { %Set Name,Component
    's01_051017m_dev_on.set',[28];
    's02_050921m_dev_on.set',[30];
%     's04_051130m_dev_on.set',[];
%     's06_051119m_dev_on.set',[];
    's09_060313n_dev_on.set',[14 22];
    's11_060920_1n_dev_on.set',[12];
    's12_060710_1m_dev_on.set',[12];
    's13_060217m_dev_on.set',[25];
    's14_060319m_dev_on.set',[24];
    's22_080513m_dev_on.set',[11 23 31];
%     's23_060711_1m_dev_on.set',[];
%     's31_061020m_dev_on.set',[];
    's35_070115m_dev_on.set',[21];
    's48_080501n_dev_on.set',[25 29];
    };
Cls7 = { %Set Name,Component
    's01_051017m_dev_on.set',[20 23];
%     's02_050921m_dev_on.set',[];
    's04_051130m_dev_on.set',[12 17 18];
%     's06_051119m_dev_on.set',[];
    's09_060313n_dev_on.set',[3 28];
    's11_060920_1n_dev_on.set',[10 13 16];
    's12_060710_1m_dev_on.set',[20 22];
    's13_060217m_dev_on.set',[14 15 22 26];
    's14_060319m_dev_on.set',[23];
    's22_080513m_dev_on.set',[3];
    's23_060711_1m_dev_on.set',[2];
    's31_061020m_dev_on.set',[9];
    's35_070115m_dev_on.set',[7 10 11 13 17 27];
    's48_080501n_dev_on.set',[2 17 20 22];
    };
Cls10 = { %Set Name,Component
    's01_051017m_dev_on.set',[13];
    's02_050921m_dev_on.set',[28];
    's04_051130m_dev_on.set',[8 14 15 26 31];
    's06_051119m_dev_on.set',[10];
    's09_060313n_dev_on.set',[10 26];
    's11_060920_1n_dev_on.set',[22 23];
    's12_060710_1m_dev_on.set',[2];
    's13_060217m_dev_on.set',[4 7];
%     's14_060319m_dev_on.set',[];
%     's22_080513m_dev_on.set',[];
    's23_060711_1m_dev_on.set',[13 18 23 25];
    's31_061020m_dev_on.set',[19 23 27 30];
    's35_070115m_dev_on.set',[4];
    's48_080501n_dev_on.set',[11 12 13];
    };
Cls12 = { %Set Name,Component
    's01_051017m_dev_on.set',[19 25];
    's02_050921m_dev_on.set',[11 17 19 21 22 29];
    's04_051130m_dev_on.set',[6 10 16];
    's06_051119m_dev_on.set',[5 12];
    's09_060313n_dev_on.set',[24];
    's11_060920_1n_dev_on.set',[2 6 7 8];
    's12_060710_1m_dev_on.set',[11 17];
    's13_060217m_dev_on.set',[18];
    's14_060319m_dev_on.set',[18];
    's22_080513m_dev_on.set',[21];
%     's23_060711_1m_dev_on.set',[];
    's31_061020m_dev_on.set',[4 5];
%     's35_070115m_dev_on.set',[];
    's48_080501n_dev_on.set',[3 16];
    };
Cls13 = { %Set Name,Component
    's01_051017m_dev_on.set',[11];
    's02_050921m_dev_on.set',[16];
%     's04_051130m_dev_on.set',[];
    's06_051119m_dev_on.set',[15];
    's09_060313n_dev_on.set',[25];
%     's11_060920_1n_dev_on.set',[];
    's12_060710_1m_dev_on.set',[9 15];
%     's13_060217m_dev_on.set',[];
    's14_060319m_dev_on.set',[20 29];
    's22_080513m_dev_on.set',[18 19 20];
    's23_060711_1m_dev_on.set',[21 29 30];
    's31_061020m_dev_on.set',[31];
    's35_070115m_dev_on.set',[6];
    's48_080501n_dev_on.set',[10];
    };
EEGDataset1 = [];
EEGDataset2 = [];
EEGDataset3 = [];
EEGDataset4 = [];
for i = 1:length(Cls13)
    fileName = Cls13{i,1};
    EEG.setname=fileName(1:end-4);
    fileName = fileName(1:end-4);
    RTfileName = fileName(1:end-7);
    RTfileName = strcat(RTfileName,'RT.txt');
    fileID = fopen(RTfileName,'r');
    RT = fscanf(fileID,'%f');
    RT = RT';
    EEG = eeg_checkset( EEG );
    EEG = eeg_checkset( EEG );
    EEG = eeg_checkset( EEG );
    EEG = eeg_checkset( EEG );
    % This tracks which version of EEGLAB is being used, you may ignore it
    EEG.etc.eeglabvers = '2019.1';
    EEG = pop_loadset('filename',strcat(fileName,'.set'),'filepath',filePath);
    EEG = eeg_checkset( EEG );
    for j = 1:length(Cls13{i,2})
        for k = 1:EEG.trials       
            if (RT(k)<0.5)
                EEGDataset1 = [EEGDataset1 EEG.data(Cls13{i,2}(1,j),:,k)];
            elseif (RT(k)>3)
                EEGDataset2 = [EEGDataset2 EEG.data(Cls13{i,2}(1,j),:,k)];
            end
        end
    end
end
%Plotting ERSP of epochs with RT<0.5
[ersp,itc,powbase,times,freqs,erspboot,itcboot,tfdata] = newtimef(EEGDataset21(:,:), 2000, [-1*1000 6.996*1000], 250, [3 0.8] , 'topovec', 1, 'elocs', EEG.chanlocs, 'chaninfo', EEG.chaninfo, 'freqs', [.5 20], 'plotersp', 'on', 'plotitc' , 'off', 'plotphase', 'off', 'timesout', 400, 'padratio', 8, 'freqscale', 'log');
%Plotting ERSP of epochs with RT>3
%[ersp,itc,powbase,times,freqs,erspboot,itcboot,tfdata] = newtimef(EEGDataset2(:,:), 2000, [-1*1000 6.996*1000], 250, [3 0.8] , 'topovec', 1, 'elocs', EEG.chanlocs, 'chaninfo', EEG.chaninfo, 'freqs', [.5 20], 'plotersp', 'on', 'plotitc' , 'off', 'plotphase', 'off', 'timesout', 400, 'padratio', 8, 'freqscale', 'log');