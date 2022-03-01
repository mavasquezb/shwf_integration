clear all
close all
clc

fileNames = ["measurment_data.csv"];

for fileName = fileNames
    matrix = csvread(fileName,101,1);
end