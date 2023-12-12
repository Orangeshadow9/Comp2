function A = stimtodB(stimulus,maxdB)

stim=20*1/log(10)*log(stimulus(:,2)./2.0e-5);
m2=max(stim);
A=maxdB-m2+stim;

