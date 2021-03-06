function a = array2textgrid3 (filename,xmin1,xmax1,text1,xmin2,xmax2,text2,xmin3,xmax3,text3)
% Function array2textgrid3 generates a 3 tier textgrid file from an array of
% interval starts, interval ends and interval labels. Function returns 1 if
% file generated sucessfully
% 1st tier for speech activity detection, 2nd tier for speaker
% segmentation, 3rd tier for speaker clustering
% This type of TextGrid file were generated by Parthe Pandit as part of
% debugging for MediaEval 2015 Broadcast news Person detection campaign
%
% Usage:
%
% array2textgrid3 (filename,xmin1,xmax1,text1,xmin2,xmax2,text2,xmin3,xmax3,text3)
% Input arguments:
% filename - name of file to be generated
% xmin - array of interval start points in seconds
% xmax - array of interval end points in seconds
% text - array of interval labels
%
% Elements of xmin and xmax are in a way redundant. But xmin(i) = xmax(i-1)
% for i = 2:length(xmin)
% xmin(1) = 0 (start fo audio)
% xmax(end) = length of audio

%%%%%%%%%%%%%%%%%%%% LICENCE TEXT %%%%%%%%%%%%%%%%%%%%%%%%%%
% This program array2textgrid3.m is part of the MATLAB Speaker Diarization Toolkit 
% <https://github.com/parthe/Speaker-Diarization-toolkit-MATLAB>
% Copyright (C) 2015 Parthe Pandit
% 
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or 
% any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.
%%%%%%%%%%%%%%%%%%%% LICENCE TEXT %%%%%%%%%%%%%%%%%%%%%%%%%%
 

    if ((length(xmin1) == length(xmax1)) && (length(xmax1) == length(text1)) && (xmin1(1) == 0) && isequal(xmin1(2:end) , xmax1(1:end - 1))) % check error
        a = 1;

        filename = [filename '.TextGrid'];
        file_leng = xmax1(end);
        n_intervals1 = length(xmax1);
        n_intervals2 = length(xmax2);
        n_intervals3 = length(xmax3);

        myformat = '%s\n';

        % print statements for initial text
        init_string = ['File type = "ooTextFile"' char(10) 'Object class = "TextGrid"' char(10) '' char(10) 'xmin = 0 ' char(10) 'xmax = ' num2str(file_leng) '' char(10) '' 'tiers? <exists> ' char(10) 'size = 3 ' char(10) 'item []: ' char(10)];
        fid = fopen(filename,'w');
        fprintf(fid,myformat,init_string);
        fclose(fid);
        
        % print statements for 1st tier
        next_init_string1 = ['    item [1]:' char(10) '        class = "IntervalTier" ' char(10) '        name = "Orig." ' char(10) '        xmin = 0 ' char(10) '        xmax = ' num2str(file_leng) ' ' char(10) '        intervals: size = ' num2str(n_intervals1)];
        fid = fopen(filename,'a');
        fprintf(fid,myformat,next_init_string1);
        fclose(fid);

        for seg_ind1 = 1:length(xmax1)
            seg_text1 = text1{seg_ind1}; % somehow text is stored as cell

            string1 = ['        intervals [' num2str(seg_ind1) ']:'];
            string2 = ['            xmin = ' num2str(xmin1(seg_ind1)) ' '];
            string3 = ['            xmax = ' num2str(xmax1(seg_ind1)) ' '];
            string4 = ['            text = "' seg_text1 '" '];

            % print statement
            fid = fopen(filename,'a');
            fprintf(fid,myformat,string1);
            fprintf(fid,myformat,string2);
            fprintf(fid,myformat,string3);
            fprintf(fid,myformat,string4);
            fclose(fid);
        end
        
        % print statements for 2nd tier
        next_init_string2 = ['    item [2]:' char(10) '        class = "IntervalTier" ' char(10) '        name = "SAD" ' char(10) '        xmin = 0 ' char(10) '        xmax = ' num2str(file_leng) ' ' char(10) '        intervals: size = ' num2str(n_intervals2)];
        fid = fopen(filename,'a');
        fprintf(fid,myformat,next_init_string2);
        fclose(fid);

        for seg_ind2 = 1:length(xmax2)
            seg_text2 = text2{seg_ind2}; % somehow text is stored as cell

            string1 = ['        intervals [' num2str(seg_ind2) ']:'];
            string2 = ['            xmin = ' num2str(xmin2(seg_ind2)) ' '];
            string3 = ['            xmax = ' num2str(xmax2(seg_ind2)) ' '];
            string4 = ['            text = "' seg_text2 '" '];

            % print statement
            fid = fopen(filename,'a');
            fprintf(fid,myformat,string1);
            fprintf(fid,myformat,string2);
            fprintf(fid,myformat,string3);
            fprintf(fid,myformat,string4);
            fclose(fid);
        end
        
        % print statements for 3rd tier
        next_init_string3 = ['    item [3]:' char(10) '        class = "IntervalTier" ' char(10) '        name = "Seg." ' char(10) '        xmin = 0 ' char(10) '        xmax = ' num2str(file_leng) ' ' char(10) '        intervals: size = ' num2str(n_intervals3)];
        fid = fopen(filename,'a');
        fprintf(fid,myformat,next_init_string3);
        fclose(fid);

        for seg_ind3 = 1:length(xmax3)
            seg_text3 = text3{seg_ind3}; % somehow text is stored as cell

            string1 = ['        intervals [' num2str(seg_ind3) ']:'];
            string2 = ['            xmin = ' num2str(xmin3(seg_ind3)) ' '];
            string3 = ['            xmax = ' num2str(xmax3(seg_ind3)) ' '];
            string4 = ['            text = "' seg_text3 '" '];

            % print statement
            fid = fopen(filename,'a');
            fprintf(fid,myformat,string1);
            fprintf(fid,myformat,string2);
            fprintf(fid,myformat,string3);
            fprintf(fid,myformat,string4);
            fclose(fid);
        end

    else
        a = 0;
    end

end