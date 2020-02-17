
[x1, Fs1] = wavread('/Users/atrinhojjat/Developer/WorkSpaces/Octave/mix1.wav'); 
[x2, Fs2] = wavread('/Users/atrinhojjat/Developer/WorkSpaces/Octave/mix2.wav'); 
[x3, Fs1] = wavread('/Users/atrinhojjat/Developer/WorkSpaces/Octave/mix3.wav'); 
[x4, Fs2] = wavread('/Users/atrinhojjat/Developer/WorkSpaces/Octave/mix4.wav'); 
[x5, Fs1] = wavread('/Users/atrinhojjat/Developer/WorkSpaces/Octave/mix5.wav'); 
xx = [x1, x2,x3,x4,x5]';
yy = sqrtm(inv(cov(xx')))*(xx-repmat(mean(xx,2),1,size(xx,2)));
[W,s,v] = svd((repmat(sum(yy.*yy,1),size(yy,1),1).*yy)*yy');

a = W*xx; %W is unmixing matrix
subplot(2,5, 1); plot(x1); title('mixed wave 1');
subplot(2,5, 2); plot(x2); title('mixed wave 2');
subplot(2,5, 3); plot(x3); title('mixed wave 3');
subplot(2,5, 4); plot(x4); title('mixed wave 4');
subplot(2,5, 5); plot(x5); title('mixed wave 5');
subplot(2,5, 6); plot(a(1,:), 'g'); title('unmixed wave 1');
subplot(2,5, 7); plot(a(2,:), 'r'); title('unmixed wave 2');
subplot(2,5, 8); plot(a(3,:), 'g'); title('unmixed wave 3');
subplot(2,5, 9); plot(a(4,:), 'r'); title('unmixed wave 4');
subplot(2,5,10); plot(a(5,:), 'g'); title('unmixed wave 5');

wavwrite( a(1,:), Fs1,'/Users/atrinhojjat/Developer/WorkSpaces/Octave/unmixed1.wav');
wavwrite( a(2,:), Fs1,'/Users/atrinhojjat/Developer/WorkSpaces/Octave/unmixed2.wav');
wavwrite( a(3,:), Fs1,'/Users/atrinhojjat/Developer/WorkSpaces/Octave/unmixed3.wav');
wavwrite( a(4,:), Fs1,'/Users/atrinhojjat/Developer/WorkSpaces/Octave/unmixed4.wav');
wavwrite( a(5,:), Fs1,'/Users/atrinhojjat/Developer/WorkSpaces/Octave/unmixed5.wav');

