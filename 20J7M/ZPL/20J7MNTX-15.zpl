set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.4884, <2> 26.3638, <3> 31.0387, <4> 33.8123, <5> 20.8257, <6> 24.9533, <7> 27.0009, <8> 21.9558, <9> 31.284, <10> 17.6831, <11> 22.0081, <12> 29.0034, <13> 29.9125, <14> 24.0251, <15> 12.6893, <16> 35.6887, <17> 23.6947, <18> 29.9927, <19> 26.7124, <20> 33.8234;
param workload[JOB] := <1> 4.6356, <2> 5.1346, <3> 5.5712, <4> 5.8148, <5> 4.5635, <6> 4.9953, <7> 5.1962, <8> 4.6857, <9> 5.5932, <10> 4.2051, <11> 4.6913, <12> 5.3855, <13> 5.4692, <14> 4.9015, <15> 3.5622, <16> 5.974, <17> 4.8677, <18> 5.4766, <19> 5.1684, <20> 5.8158;
param capacity[MACHINE] := <1> 10.8972, <2> 10.8972, <3> 10.8972, <4> 10.8972, <5> 10.8972, <6> 10.8972, <7> 10.8972;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
