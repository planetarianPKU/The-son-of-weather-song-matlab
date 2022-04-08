% Usage : play(treble, treble_duration, bass, bass_duration)
%
%                  treble -> 高音音符
%         treble_duration -> 高音音符持续时间
%                    bass -> 低音音符
%           bass_duration -> 低音音符持续时间

function music = play(treble, treble_duration,high ,high_duration,h2,h2dur, bass, bass_duration,b2,b2dur,b3,b3dur)
treble_vector=make_vector(treble,treble_duration);
high_vector=make_vector(high,high_duration);
bass_vector=make_vector(bass,bass_duration);
h2_vector=make_vector(h2,h2dur);
b2_vector=make_vector(b2,b2dur);
b3_vector=make_vector(b3,b3dur);
%合成矢量
fs = 11025;               % sampling frequency, 11025 Hz on PC/Mac
%speed_factor = 71/60;      % cpu speed compensation factor
music_vector = treble_vector +high_vector +h2_vector+bass_vector+b2_vector+b3_vector;      % treble and bass vector combination
audiowrite('Tianqizhizi_violin.wav',music_vector,fs);
%sound( music_vector, fs );                        % generate sound

%{
treble_vector = zeros(1,sum(treble_duration)*fs+1);  % treble vector generator
n1 = 1;                                              % starting index
for kk = 1:length(treble)
    keynum = treble(kk);
                                                            %
    if (keynum == 0)                                  % rest period definition
        A = 0.0;                                       % amplitude at 0.0
        freq = 440;
    else
        A = 0.5;                                       % note amplitude at 0.5
        freq = 440 * (2^( (keynum-49)/12 ));           % frequency definition
    end
    tt = 0 : (1/fs) : (treble_duration(kk)/speed_factor);  % duration generator
    tone = A*guitar(keynum,tt);                    % tone generator
   %tone=A*ricker(treble_duration(kk)/speed_factor,freq);                                                              %
    n2 = n1 + length(tone) - 1;                            % ending index & concatenate vector
    treble_vector(n1:n2) = treble_vector(n1:n2) + tone;    % vector generator
    n1 = n2;                                               % reset index
end

high_vector = zeros(1,sum(high_duration)*fs+1);  % treble vector generator
n1 = 1;                                              % starting index
for kk = 1:length(high)
    keynum = high(kk);
                                                            %
    if (keynum == 0)                                  % rest period definition
        A = 0.0;                                       % amplitude at 0.0
        freq = 440;
    else
        A = 0.5;                                       % note amplitude at 0.5
        freq = 440 * (2^( (keynum-49)/12 ));           % frequency definition
    end
    tt = 0 : (1/fs) : (high_duration(kk)/speed_factor);  % duration generator
    tone = A*guitar(keynum,tt);                    % tone generator
   %tone=A*ricker(treble_duration(kk)/speed_factor,freq);                                                              %
    n2 = n1 + length(tone) - 1;                            % ending index & concatenate vector
    high_vector(n1:n2) = high_vector(n1:n2) + tone;    % vector generator
    n1 = n2;                                               % reset index
end


bass_vector = zeros(1,sum(bass_duration)*fs+1);           % bass vector generator
n1 = 1;
for kk = 1:length(bass)
    keynum = bass(kk);
    %
    if (keynum == 0)
        A = 0;
        freq = 440;
    else
        A = 0.5;
        freq = 440 * (2^( (keynum-49)/12 ));
    end
    tt = 0 : (1/fs) : (bass_duration(kk)/speed_factor);
    tone = A*guitar(keynum,tt);
    %tone=A*ricker((bass_duration(kk)/speed_factor),freq);
    %
    n2 = n1 + length(tone) - 1;
    bass_vector(n1:n2) = bass_vector(n1:n2) + tone;
    n1 = n2;
end
%}

%plot(music_vector);
