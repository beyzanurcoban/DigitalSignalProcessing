clear

%asking user to decide which wave is produced
wave = input('Enter square or sawtooth: ','s');

%sin waves are calculated at these points
x = linspace(0,8*pi,1000);

%if user input is equal to square (they are string), square function is
%produced
if strcmp(wave, 'square') 
   y = 0; %initial function value is zero, then we add new sin values to it
   %n is the coefficient of x and divider of sin 
   for n=1:2:100 %square function is valid for odd n
       y = y + sin(n.*x)/n; %for each odd n, new sin wave is added to function
       %plotting and putting labels and title
       plot(x,y,'b'); 
       grid on
       title('Square wave')
       xlabel('x')
       ylabel('f(x)')
       pause(0.5)
   end    
%if user input is equal to sawtooth (they are string), sawtooth function is
%produced   
elseif strcmp(wave, 'sawtooth')
       y = 0; %initial function value is zero, then we add new sin values to it
       %n is the coefficient of x and divider of sin 
       for n=2:2:100 %sawtooth function is valid for even n
           y = y + sin(n.*x)/n; %for each even n, new sin wave is added to function
           %plotting and putting labels and title
           plot(x,y,'r');
           grid on
           title('Sawtooth wave')
           xlabel('x')
           ylabel('f(x)')
           pause(0.5)
       end    
    
else 
    %everything except the square and sawtooth is invalid input
    disp('Invalid input!');
end    