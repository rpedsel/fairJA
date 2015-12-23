set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 4.2159, <2> 38.476, <3> 34.8047, <4> 31.9097, <5> 43.3527, <6> 13.6055, <7> 29.451, <8> 17.7491, <9> 31.013, <10> 24.3454, <11> 26.5347, <12> 47.0665, <13> 38.4854, <14> 25.0157, <15> 19.7291, <16> 45.9427, <17> 15.9501, <18> 10.0434, <19> 25.5565, <20> 3.9473;
param workload[JOB] := <1> 25.053, <2> 29.3856, <3> 2.1153, <4> 40.0261, <5> 44.0128, <6> 6.6017, <7> 4.3209, <8> 28.9037, <9> 42.188, <10> 3.9151, <11> 10.9411, <12> 38.3811, <13> 22.1377, <14> 39.2288, <15> 13.8273, <16> 11.2881, <17> 45.2547, <18> 16.3733, <19> 44.9457, <20> 20.9223;
param capacity[MACHINE] := <1> 69.9746, <2> 69.9746, <3> 69.9746, <4> 69.9746, <5> 69.9746, <6> 69.9746, <7> 69.9746;

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
