function [n, loss, l, r] = getAudioData( N, Audio, nfr )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
 
nFOP = Audio.nFramesPerChunk * Audio.nChunksOnPort;
lfi = Audio.lastFrameIndex;
ofi = max(0, lfi - nFOP + 1); 

% Detect a data loss 
loss = 0;
if (nfr < ofi)
    loss = ofi - nfr;
    nfr = ofi;
end

% Compute the starting position in the left and right input arrays */
 pos = nFOP - (lfi - nfr + 1);

% Fill the output arrays l and r */
 n = 0;
 
l = Audio.left{pos:length(Audio.left)}
 
r = Audio.right{pos:length(Audio.right)}
%  l = []
%  r = []
%  while (n < N && pos < nFOP)
%     l[n] = Audio.left{pos};
%     r[n] = Audio.right[pos];
%     n = n + 1;
%     pos = pos + 1;
%     nfr = nfr + 1;
%  end
%  
 
end
