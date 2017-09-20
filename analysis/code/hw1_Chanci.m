%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Binghamton University                         %
% PhD in Economics                              %
% ECON634 Advanced Macroeconomics               %
% Fall 2017                                     %
% Luis Chancí (lchanci1@binghamton.edu)         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd 'C:\Users\Chanci\Dropbox\PhD\III. Third Year\1. ECON-634 Advanced Macroeconomics\Hw\hw1\problem-set-1-luischanci'

cd analysis\input
I = csvread('income.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. Transition Matrix for Income (Using PSID)  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Q = quantile(I,0.2:0.2:1);
T = zeros(5);
for i=1:5
    if i==1; A = find(I(:,1)<=Q(i,1)); 
       else; A = find(I(:,1)>Q(i-1,1)&I(:,1)<=Q(i,1));
    end
    for j=1:5
        if j==1; B = find(I(:,2)<=Q(j,2));
           else; B = find(I(:,2)>Q(j-1,2)&I(:,2)<=Q(j,2));
        end
    T(i,j)=sum(sum(abs(bsxfun(@minus,A(:),B(:).'))==0));
    end
end
T = bsxfun(@rdivide,T,sum(T')'); latex(sym(T));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Lorenz Curve for Income (Using PSID)       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pop = ((1:1:length(I(:,1)))/length(I(:,1)))*100;
Inc = bsxfun(@rdivide,cumsum(sort(I)),sum(I))*100;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Gini Coefficient for Income (Using PSID)   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd ..\.. 
cd analysis\code
g=[];
for i=1:2
 W=find(I(:,i)>=0); w=I(W,i); g=[g,ginicoeff(ones(length(w),1),w)];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   Outputs                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd ..\.. 
cd analysis\output 

display('Transition Matrix '); T                % Transition Matrix

plot(pop',Inc,pop',pop','-k');                  % Lorenz
     ylabel('Cumilative Share of Income'); ylim([0 100]);
     xlabel('Cumulative Share of People'); xlim([0 100]);
     legend('2001','2007','Location','northwest');
     title('Lorenz Curve and Gini Coefficient');

display('Gini: 2001 and 2007, ');  g            % Gini         
%%%%%%%%%%%%%%%%%%%%% Ch %%%%%%%%%%%%%%%%%%%%%%%%