set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.295, <2> 26.0346, <3> 29.6497, <4> 25.9118, <5> 22.4322, <6> 24.1329, <7> 28.6553, <8> 26.2261, <9> 28.1543, <10> 29.9294, <11> 31.2703, <12> 24.5992, <13> 26.1139, <14> 24.9427, <15> 32.3292, <16> 30.561, <17> 23.0455, <18> 28.3535, <19> 25.3219, <20> 19.6284;
param workload[JOB] := <1> 25.05, <2> 9.1395, <3> 47.3709, <4> 1.022, <5> 12.9691, <6> 49.2389, <7> 35.4087, <8> 5.2668, <9> 32.7269, <10> 15.2938, <11> 22.4344, <12> 3.6194, <13> 6.6597, <14> 16.1464, <15> 2.967, <16> 38.1065, <17> 49.8638, <18> 19.515, <19> 9.1939, <20> 4.4827;
param capacity[MACHINE] := <1> 50.8094, <2> 50.8094, <3> 50.8094, <4> 50.8094, <5> 50.8094, <6> 50.8094;

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
