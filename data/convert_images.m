% convert images into .mat files to be accessible on the web

files = dir();

for i = 1 : length(files)
    if ~files(i).isdir
        file = files(i).name;
        [pathstr, name, ext] = fileparts(file);
        
        switch ext
            case {'.png', '.jpg'}
                im = imread(file);
                
        save([pathstr, name, '.mat'], 'im')
        end
    end
end
        