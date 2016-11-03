function [pyramid] = createpyramid(img, levels)
    img_old = img;
    cur_gauss = 2;
    img_cur = imgaussfilt(img,cur_gauss);
    for k = 1:levels-1
        pyramid{k} = img_old - img_cur;
        %figure, imshow(pyramid{k});
        img_old = img_cur;
        cur_gauss = cur_gauss * 2;
        img_cur = imgaussfilt(img_cur,cur_gauss);
    end
    pyramid{levels} = img_cur;
end