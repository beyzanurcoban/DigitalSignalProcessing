clear 

numberOfRounds = 0; %number of rounds is zero initially
userWins = 0; %number of rounds that user wins is zero initially
compWins = 0; %number of rounds that computer wins is zero initially

%this competition should continue until any one has 3 points 
while (userWins ~= 3 && compWins ~= 3)
%asking user to pick rock, paper or scissors as an integer
userChoice = input('Pick your choice:\n For Rock: 1\n For Paper: 2\n For Scissors: 3\n');

%computer produce a random number between 1 and 3 in each round 
compChoice = randi(3,1);

%informing the user about what the computer chooses
%comparing random numbers with meanings
if compChoice == 1
    disp('Your opponent picked Rock');
elseif compChoice ==2 
    disp('Your opponent picked Paper');
else
    disp('Your opponent picked Scissors');
end

%the situation that user picked rock
if userChoice == 1
    if compChoice == 1
        %both of them picked rock, no one got point
        disp('It is a tie.');
    elseif compChoice == 2
        %computer picked paper and it won
        disp('You lost!');
         %the number of rounds that computer wins increased
        compWins = compWins + 1;
    else 
        %computer picked scissors and user won
        disp('You won!');
        %the number of rounds that user wins increased
        userWins = userWins + 1;
    end
%the situation that user picked paper    
elseif userChoice == 2
    if compChoice == 1
        %computer picked rock and user won
        disp('You won!');
        %the number of rounds that user wins increased
        userWins = userWins + 1;
    elseif compChoice == 2
        %both of them picked paper, no one got point
        disp('It is a tie');
    else 
        %computer picked scissors and it won
        disp('You lost!');
         %the number of rounds that computer wins increased
        compWins = compWins + 1;
    end
%the situation that user picked scissors    
else 
    if compChoice == 1
        %computer picked rock and it won
        disp('You lost!');
         %the number of rounds that computer wins increased
        compWins = compWins + 1;
    elseif compChoice == 2
        %computer picked paper and user won
        disp('You won!');
        %the number of rounds that user wins increased
        userWins = userWins + 1;
    else 
        %both of them picked scissors, no one got points
        disp('It is a tie');
    end
end
%in every round, number of rounds increases
numberOfRounds = numberOfRounds + 1;
end

%deciding winner, when someone reach 3 points system goes out of loop
if userWins == 3
    fprintf('You won in %d rounds.',numberOfRounds);
else 
    fprintf('The computer won in %d rounds.',numberOfRounds);
end    