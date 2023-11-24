% ������������
clc;
clear;
planets = {'Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune', 'Pluto'};

ifSaveGif =1; %�Ƿ񱣴�gif
sleep = 0.05; %gif����ʱ�� ��λ��S
deltaTheta = 2.5; %�Ƕȱ仯����

a = [0.387 0.723 1 1.524 5.203 9.582 19.189 30.069 39.482]; % �볤��
e = [0.2056 0.0068 0.0167 0.0934 0.0483 0.056 0.045 0.0113 0.2488]; % ƫ����
b = a.*sqrt(1-e.^2); %�����
T = [0.24 0.62 1 1.88 11.86 29.46 84.01 164.79 248.54]; % ����  ������

frame = 100;

figure;
hold on;

SunX = 0 ; %̫����X��ʼֵ
SunY = 0 ; %̫����Y��ʼֵ
X=[];
Y=[];
plot(SunX,SunY,'o');
text(SunX,SunY,'Sun');

% % ������Բ�ϵĵ������
t = linspace(0, 2*pi, frame); % �Ƕȷ�Χ




%���ƾ�̬ͼ
for i = 1:length(a)
    
    x = SunX + a(i)*cos(t) +e(i)*a(i);
    y = SunY + b(i)*sin(t);
    plot(x,y);
    text(a(i)*(1+e(i)),0, planets{i});
end


%���ƶ�̬ͼ
theta = zeros(1,length(a));
pic_num=1;



for j  = 1:200
    for i = 1:length(a)
        theta(i) = 2*pi*j/T(i)*deltaTheta;
        if theta(i) <2*pi
            x = SunX + a(i)*cos(theta(i)) +e(i)*a(i);
            y = SunY + b(i)*sin(theta(i));
            plot(x,y,'o');
        end       
    end
    if ifSaveGif
    F=getframe(gcf);
    I=frame2im(F);
    [I,map]=rgb2ind(I,256);
    if pic_num == 1
        imwrite(I,map,'plants.gif','gif', 'Loopcount',inf,'DelayTime',0.2);
    else
        imwrite(I,map,'plants.gif','gif','WriteMode','append','DelayTime',0.2);
    end
    pic_num = pic_num + 1;
    else
    pause(sleep);
    end
end