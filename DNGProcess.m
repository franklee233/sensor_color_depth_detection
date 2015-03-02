function dngprocess()
filename='/Users/franklhb/downloads/1.dng'
% info = imfinfo(filename);
% info.SubIFDs{1};
warning off MATLAB:tifflib:TIFFReadDirectory:libraryWarning
warning off
t = Tiff(filename,'r');
offsets = getTag(t,'SubIFD');
setSubDirectory(t,offsets(1));
cfa = read(t);
row = size(cfa,1);
col = size(cfa,2);
close(t);

% data = cell(row,col);
% for i=1:row
%     for j=1:col
%         data{i,j}=cfa(i,j);
%     end
% end
% cell2csv('1.csv',data);
% size(data)

% red_max=0;
% red_min=10000;
% 
% blue_max=0;
% blue_min=10000;
% 
% green_max=0;
% green_min=10000;

pixel_num=col*row;

red_array=ones(pixel_num/4,1);
blue_array=ones(pixel_num/4,1);
green_array=ones(pixel_num/2,1);

red_pointer=1;
green_pointer=1;
blue_pointer=1;

for i=1:row
    for j=1:col
        if mod(i,2)==1 && mod(j,2)==1
%             if cfa(i,j)>red_max
%                 red_max=cfa(i,j);
%             end
%             if cfa(i,j)<red_min
%                 red_min=cfa(i,j);
%             end
            red_array(red_pointer)=cfa(i,j);
            red_pointer=red_pointer+1;
        elseif mod(i,2)==0 && mod(j,2)==0
%             if cfa(i,j)>blue_max
%                 blue_max=cfa(i,j);
%             end
%             if cfa(i,j)<blue_min
%                 blue_min=cfa(i,j);
%             end
            blue_array(blue_pointer)=cfa(i,j);
            blue_pointer=blue_pointer+1; 
        elseif (mod(i,2)+mod(j,2))==1
%             if cfa(i,j)>green_max
%                 green_max=cfa(i,j);
%             end
%             if cfa(i,j)<green_min
%                 green_min=cfa(i,j);
%             end
            green_array(blue_pointer)=cfa(i,j);
            green_pointer=green_pointer+1;
        end
    end
end

% red_max
% red_min
% blue_max
% blue_min
% green_max
% green_min
red_unique=size(unique(red_array),1)
blue_unique=size(unique(blue_array),1)
green_unique=size(unique(green_array),1)




        