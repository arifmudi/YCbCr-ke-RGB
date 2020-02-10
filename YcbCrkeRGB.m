clc; clear;

%%% proses merubah warna YCbCr menjadi RGB

%%% created by: Arif Mudi Priyatno 
%%% https://github.com/arifmudi

%% load data
load('dataCbCr.mat')

%% merubah uint8 menjadi double
Y = double(Y);
Cb = double(Cb);
Cr = double(Cr);

%% normasilasi 0-255 menjadi 0-1
if max(max(Y)) > 1.0 || max(max(Cb)) > 1.0 || max(max(Cr)) > 1.0
   Y = Y / 255;
   Cb = Cb / 255;
   Cr = Cr / 255;
end

%% mencari panjang dan lebar nya
[panjang, lebar] = size(Y);

%% proses Konversi YCbCr menjadi RGB
for m=1:panjang
    for n=1:lebar
       R(m,n) = Y(m,n) + 1.402 * Cr(m,n);
       G(m,n) = Y(m,n) - 0.34414 * Cb(m,n)  - 0.71414 * Cr(m,n);
       B(m,n) = Y(m,n) + 1.7720 * Cb(m,n);
    end
end

%% konversi nilai 0-1 menjadi 0-255
R = R * 255;
G = G * 255;
B = B * 255;

%% konversi double ke uint8
R = uint8(R);
G = uint8(G);
B = uint8(B);
