function [audio, n, nfr, loss] = getAudioData(p, N, nfr)

fop = p.Audio.nFramesPerChunk * p.Audio.nChunksOnPort;
lfi = p.Audio.lastFrameIndex;
ofi = max(0, lfi - fop + 1);

% Detect a data loss
loss = 0;
if (nfr < ofi)
    loss = ofi - nfr;
    nfr = ofi;
end

% Compute the starting position in the left and right input arrays
pos = fop - (lfi - nfr);

% Fill the output arrays l and r
n = min(N, fop - pos);
audio = struct('left', zeros(n,1), 'right', zeros(n,1));

i = 1;
while (i <= n)
    audio.left(i) = p.Audio.left{pos};
    audio.right(i) = p.Audio.right{pos};
    i = i + 1;
    pos = pos + 1;
    nfr = nfr + 1;
end

end

