set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.6097, <2> 8.3531, <3> 8.4275, <4> 34.446, <5> 48.8823, <6> 5.3304, <7> 44.3045, <8> 22.7884, <9> 39.5326, <10> 34.2973, <11> 34.8329, <12> 43.547, <13> 27.2001, <14> 40.2503, <15> 37.3476, <16> 7.2479, <17> 26.2635, <18> 38.9345, <19> 8.0054, <20> 26.6893;
param workload[JOB] := <1> 0.414, <2> 8.9356, <3> 35.2411, <4> 18.2899, <5> 23.1484, <6> 4.4131, <7> 24.7215, <8> 39.308, <9> 19.6463, <10> 16.822, <11> 27.4413, <12> 2.879, <13> 23.5708, <14> 44.9855, <15> 2.4458, <16> 32.3815, <17> 43.9119, <18> 29.1081, <19> 39.8667, <20> 16.0822;
param capacity[MACHINE] := <1> 48.6013, <2> 48.6013, <3> 48.6013, <4> 48.6013, <5> 48.6013, <6> 48.6013, <7> 48.6013;

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
