% Loads a DICOM file into a structure with some basic informations.
function [dicoms, numfiles] = loadDicom(folder)
    files = dir(folder);
    numfiles = numel(files);
    data = {};
    
    % DICOM file detector from the given folder. It returns a cell of images
    % and informations related to them.
    j = 1;
    for i = 3:length(files)
        filename = files(i).name;
        if isdicom(fullfile(folder, filename))
            %disp("DICOM file detected: " + filename);
            info = dicominfo(filename);
    
            data{j, 1} = dicomread(info);
            data{j, 2} = info.Rows;
            data{j, 3} = info.Columns;
            data{j, 4} = info.PixelSpacing;
            data{j, 5} = info.SliceThickness;
            data{j, 6} = info.SliceLocation;
            data{j, 7} = info.SpacingBetweenSlices;
            data{j, 8} = info.Modality;
            j = j + 1;
        end 
    end
    dicoms = cell2struct(data, ["SliceData", "Rows", "Columns", "PixelSpacing", "SliceThickness", "SliceLocation", "SpacingBetweenSlices", "Modality"], 2);
    [~, I] = sort([dicoms.SliceLocation]);
    dicoms = dicoms(I);
end

