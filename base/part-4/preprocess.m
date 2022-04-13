function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
  folder_names = readdir(path_to_dataset); # gasim folderele
  number = length(folder_names);
  total = 0;
  for j = 3:number # incepem de la 3 pentru ca primele sunt . si ..
    cell = strfind(folder_names(j), 'cats'); # ne ocupam doar de folderele
                                             # cats si not_cats
    if ~isempty(cell{1})
      names = readdir(strjoin([path_to_dataset,folder_names(j)], '/'));
      dim = length(names);
      start = 1;
      ## vom selecta doar fisierele cu .jpg la final
      cell = strfind(names(start), '.jpg');
      while isempty(cell{1})
        cell = strfind(names(++start), '.jpg');
      endwhile
      cell = strfind(names(dim), '.jpg');
      while isempty(cell{1})
        cell = strfind(names(--dim), '.jpg');
      endwhile
      ## aplicam conform parametrului histogram conversia
      for i = start:dim
        if strcmp(histogram, 'RGB') == 1
          X(total + i - 2,:) = rgbHistogram(strjoin([path_to_dataset,folder_names(j),names(i)], '/'), count_bins);
        else
          X(total + i - 2,:) = hsvHistogram(strjoin([path_to_dataset,folder_names(j),names(i)], '/'), count_bins);
        endif
      endfor
      ## completam cu 1 sau -1, dupa numele folderului
      cell = strfind(folder_names(j), 'not_cats');
        if isempty(cell{1})
          y(total + 1 : total + 1 + dim - start) = 1;
        else
          y(total + 1 : total + 1 + dim - start) = -1;
        endif
      total = dim - start + 1;
    endif
  endfor
endfunction
