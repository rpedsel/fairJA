set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 37.9209, <2> 13.9028, <3> 34.2011, <4> 43.2886, <5> 1.031, <6> 28.0008, <7> 19.7156, <8> 7.62, <9> 22.6344, <10> 18.073, <11> 30.6035, <12> 34.0675, <13> 48.9069, <14> 32.9181, <15> 24.6608, <16> 45.7063, <17> 11.9357, <18> 39.2595, <19> 25.7268, <20> 18.7905;
param workload[JOB] := <1> 1437.9947, <2> 193.2878, <3> 1169.7152, <4> 1873.9029, <5> 1.063, <6> 784.0448, <7> 388.7049, <8> 58.0644, <9> 512.3161, <10> 326.6333, <11> 936.5742, <12> 1160.5946, <13> 2391.8849, <14> 1083.6013, <15> 608.1551, <16> 2089.0659, <17> 142.4609, <18> 1541.3083, <19> 661.8682, <20> 353.0829;
param capacity[MACHINE] := <1> 2530.6176, <2> 2530.6176, <3> 2530.6176, <4> 2530.6176, <5> 2530.6176, <6> 2530.6176, <7> 2530.6176;

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
