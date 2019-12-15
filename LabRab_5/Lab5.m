%Первая часть задания
pic = ones(800);
MyIm = pic./2;
%Вторая часть задания
K = imnoise(MyIm, 'gaussian', 0.02);
J = noise(MyIm, 'gaussian', 800, 800);

%Третья часть задания
shsh = figure('visible','off');
SHUM = histogram(J);
papka = ['Itogi'];
if ~exist(papka)
    mkdir(papka);
end
cd(papka);
saveas(SHUM, '3_parts', 'png');
cd('../');
close(shsh)

%Четвертая часть задания
One = im2double(imread('object1.png'));
midFig = merge(One, J, 365, 386);
cd(papka);
imwrite(midFig, '4_parts.png');
cd('../');

%Пятая часть задания
bigOne = imresize(One, 2); %Bilinear
midFig = merge(bigOne, J, 330, 372);
cd(papka);
if ~exist('5_parts')
    mkdir('5_parts');
end
cd('5_parts');
imwrite(midFig, 'Bilineynayainterpolyaciya.png'); 
cd('../');
cd('../');
CubeOne = imresize(One, 3, 'cubic'); 
midFig = merge(CubeOne, J, 295, 358);
cd(papka);
cd('5_parts');
imwrite(midFig, 'Bicubinterpolyaciya.png'); 
cd('../');
cd('../');
NeighOne = imresize(One, 0.5, 'nearest'); 
midFig = merge(NeighOne, J, 385, 393);
cd(papka);
cd('5_parts');
imwrite(midFig, 'Metodsoseda.png'); 
cd('../');
cd('../');

%Шестая часть задания
Salty = noise(MyIm, 'salt & pepper', 800, 800);
tri = im2double(imread('object2.png'));
cir = im2double(imread('object3.png'));
tri = imresize(tri, 2, 'nearest');
cir = imresize(cir, 2, 'nearest');
Salty = merge(tri, Salty, 5, 5);
Salty = merge(cir, Salty, 690, 690);
cd(papka);
imwrite(Salty, '6_parts.png');
cd('../');

%Седьмая часть задания
cd(papka);
imwrite(flip(Salty,2), '7_parts.png');
cd('../');

%Восьмая часть задания
cd(papka);
imwrite(flip(Salty), '8_parts.png');
cd('../');

%Девятая часть задания
cd(papka);
imwrite(imrotate(Salty, 315), '9_parts.png');
cd('../');

%Десятая часть задания
cd(papka);
imwrite(imrotate(Salty, 45), '10_parts.png');
cd('../');

%Одиннадцатая часть задания
ground = imread('fon.png');

%Двенадцатая часть задания
cd(papka);
imwrite(imcrop(ground, [500 100 799 799]), '12_parts.png');
cd('../');

%Тринадцатая часть задания
cd(papka);
imwrite(imcrop(ground, [500 100 799 799])*0.25, '13_parts.png');
cd('../');

%Четырнадцатая часть задания
Firewatch = imcrop(ground, [500 100 799 799])*0.25;
Firewatch = rgb2gray(Firewatch);
Firewatch = im2double(Firewatch);
Firewatch = merge(tri, Firewatch, 5, 5);
Firewatch = merge(cir, Firewatch, 690, 690);
Pict1 = noise(Firewatch, 'gaussian', 800, 800);
cd(papka);
imwrite(Pict1, '14_parts.png');
cd('../');

%Пятнадцатая часть задания
Safe = Pict1;
for i = 1:size(Safe,1)
    for j = 1:size(Safe,2)
        Safe(i,j) = 1-Safe(i,j);
    end
end
cd(papka);
imwrite(Safe, '15_parts.png');
cd('../');

%Шестнадцатая часть задания
Firewatch = imcrop(ground, [330 90 799 799])*0.58;
Firewatch = rgb2gray(Firewatch);
Firewatch = im2double(Firewatch);
Firewatch = merge(One, Firewatch, 500, 350);
Pict2 = noise(Firewatch, 'gaussian', 800, 800);
cd(papka);
imwrite(Pict2, '16_parts.png');
cd('../');

%Семнадцатая часть задания
cd(papka);
imwrite(Pict2-Pict1, '17_parts.png');
cd('../');

