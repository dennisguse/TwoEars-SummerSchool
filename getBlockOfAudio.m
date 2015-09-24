function [block, nfr] = getBlockOfAudio(bass, N, nfr)

block = struct('left', zeros(N,1), 'right', zeros(N,1));

remain = N;
read = 0;
p = bass.Audio();
if (nfr < 0)
    nfr = p.Audio.lastFrameIndex;
end

while (remain > 0)
    p = bass.Audio();
    [audio, n, nfr, loss] = getAudioData(p, remain, nfr);
    if (loss)
        fprintf('Lost %d frames!\n', loss);
    end
    
    if (n > 0)
        block.left((read + 1):(read + n)) = audio.left(:);
        block.right((read + 1):(read + n)) = audio.right(:);
    end
    
    read = read + n;
    remain = remain - n;
end

end