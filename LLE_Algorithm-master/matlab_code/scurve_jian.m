% S-CURVE DATASET

  N=2000;% 样本数
  K=12;% 近邻数
  d=2; % 降至d维
  
% PLOT TRUE MANIFOLD
  tt = [-1:0.1:0.5]*pi; %坐标轴取值范围是-1*pi到0.5*pi，间隔是0.1*pi
  uu = fliplr(tt); %将tt矩阵翻转
  hh = [0:0.1:1]*5;
  xx = [cos(tt) -cos(uu)]'*ones(size(hh));
  yy = ones(size([tt uu]))'*hh;
  zz = [sin(tt) 2-sin(uu)]'*ones(size(hh));
  cc = [tt uu]' * ones(size(hh));

  subplot(1,3,1);%画布里有三张图，1*3，即一行3列，而现在画的图位于第一个位置（按从左到右，从上到下的顺序）
  surf(xx,yy,zz,cc);%三维色图

% GENERATE SAMPLED DATA
    
  angle = pi*(1.5*rand(1,N/2)-1); 
  angle_lr = fliplr(angle);
  height = 5*rand(1,N);
  X = [[cos(angle), -cos(angle_lr)]; height; [ sin(angle), 2-sin(angle_lr)]];

% SCATTERPLOT OF SAMPLED DATA
  subplot(1,3,2);
  scatter3(X(1,:),X(2,:),X(3,:),12,[angle angle_lr],'+');%三维散点图

% RUN LLE ALGORITHM
Y=lqd_lle(X,K,d);

% SCATTERPLOT OF EMBEDDING
  subplot(1,3,3); cla;
  scatter(Y(1,:),Y(2,:),12,[angle angle_lr],'+');
  

