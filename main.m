clc
clear all
fs = 12500;
bits = 16;
recObj = audiorecorder(fs, bits, 1);
traindir='train/';
testdir='test/';
disp('Welcome to Speaker Authentication System');
disp(' ');
disp('Enter 1 for registration and 2 for authentication');
disp(' ');
num=input('Enter you Choice:');
if num==1
    disp(' ');
    disp(' ');
    disp('Welcome to Registration!');
    disp('Press any Key to continue');
    pause
    disp(' ');
    disp('Instructions:');
    disp('1) Please make sure that you dont have other nose producing elements in the background.');
    disp('2) The Recording is for 2s so try to keep calm for first 0.5s and take say a "Hello" after that.');
    disp('3) Make sure to type your name correctly.');
    disp(' ');
    name=input('Enter your name:');
    disp('Press any key to start the recording');
    disp(' ');
    pause
    disp('Start speaking.')
    recordblocking(recObj, 2);
    disp('End of Recording.');
    
    %# Play back the recording.
    play(recObj);

    %# Store data in double-precision array.
    myRecording = getaudiodata(recObj);
    %disp(size(myRecording));

    %# Plot the waveform.
    %plot(myRecording);
    saveloc=strcat(traindir,name);
    wavwrite(myRecording, fs, bits,saveloc);
    %#wavplay(myRecording,fs);
    code=train('train')
    disp('Registration Succesfully Completed');
end
if num==2
    disp('Welcome to User Authentication!');
    disp('Press any Key to continue');
    pause
    disp(' ');
    disp('Instructions:');
    disp('1) Please make sure that you dont have other nose producing elements in the background.');
    disp('2) The Recording is for 2s so try to keep calm for first 0.5s and take say a "Hello" after that.');
    disp('3) Make sure to type your name correctly.');
    disp(' ');
    name=input('Enter your name:');
    disp('Press any key to start the recording');
    disp(' ');
    pause
    disp('Start speaking.')
    recordblocking(recObj, 2);
    disp('End of Recording.');

    %# Play back the recording.
    play(recObj);

    %# Store data in double-precision array.
    myRecording = getaudiodata(recObj);
    %disp(size(myRecording));

    %# Plot the waveform.
    %plot(myRecording);
    saveloc=strcat(testdir,name);
    wavwrite(myRecording, fs, bits,saveloc);
    %#wavplay(myRecording,fs);
    code=train('train');
    test('test',code,name);
    disp('Completed');
end

