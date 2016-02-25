function main_LDAcalc(directory_Training, directory_Trial, savePNG, identifier)
%
% :-:-:-:-:-:-:-:-:-: Up to date INFO :-:-:-:-:-:-:-:-:
%
% (25/Feb/2016) Caution! Function LDAfuncex_P300 and LDAfuncex_SSVEP has not been 
% public so far because of the author rights. Those of codes are modified 
% version (implemented shrinkage algorhythm or so) of the LDA algorhythm 
% function which released in MATLAB central. Please, refer to the following link.
%
% http://www.mathworks.com/matlabcentral/fileexchange/29673-lda--linear-discriminant-analysis
%
% :::::::::::::::::::: Instruction ::::::::::::::::::::
%
% main_LDAcalc(ARG_1(char), ARG_2(char), ARG_3(double), ARG_4(double))
%
% === Input % ===
%
% ARG_1 directory_Training(char): File directory location which has training csv files generated by OpenViBE
% ARG_2 directory_Trial(char): File directory location which has trial csv files generated by OpenViBE
% ARG_3 savePNG(double): If you want to save the result of the graph, this value should be set to 1, othewise 0
% ARG_4 identifier(double): Value of file identifier, if(SSVEP) value = 1; elseif(P300) value = 2;
%
% === Output % ===
%
% Figure: Probability of each duration versus each targets (Grid)
%
% === Example % ===
%
% MATLAB > main_LDAcalc('../User/DirectoryName/Target', '../User/DirectoryName/Trial', 1, 1)
% MATLAB > main_LDAcalc('../User/DirectoryName/Target', '../User/DirectoryName/Trial', 0, 0)
%
% ::::: (C) Takumi Kodama, University of Tsukuba, Japan :::::

if(identifier == 1), [ProbSSVEP_2cls, ProbSSVEP_4cls] = LDAcalc_SSVEP(directory_Training, directory_Trial);
elseif(identifier == 2), [ProbP300_2cls, ProbP300_4cls] = LDAcalc_P300(directory_Training, directory_Trial);end

figure
for i = 1:4
    graph(i) = subplot(2,2,i);
    title(graph(i), strcat('Discriminant Score Duration', num2str(i)));
    if(identifier == 1)
        ProbAll = vertcat(ProbSSVEP_4cls(i,:), ProbSSVEP_2cls(i,:));
        DepictMatrix(ProbAll, {'Target1','Target2','Target3','Target4'}, {'SSVEPProb-4cls', 'SSVEPProb-2cls'})
        
    elseif(identifier == 2)
        ProbAll = vertcat(ProbP300_4cls(i,:), ProbP300_2cls(i,:));
        DepictMatrix(ProbAll, {'Target1','Target2','Target3','Target4'}, {'P300Prob-4cls', 'P300Prob-2cls'});
    end
end

if(savePNG == 1)
    if(identifier == 1), filename_Prob = strcat(directory_Trial, '/_ResultP300Prob(SSVEP).png');
    elseif(identifier == 2), filename_Prob = strcat(directory_Trial, '/_ResultP300Prob(LDA).png');end
    set(gcf,'Position', [0 0 1920 1080], 'PaperPositionMode', 'auto')
    print(filename_Prob,'-dpng','-r0')
end

end