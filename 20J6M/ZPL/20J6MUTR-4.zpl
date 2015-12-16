set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.8921, <2> 39.4132, <3> 23.0701, <4> 15.127, <5> 35.191, <6> 32.0406, <7> 13.4702, <8> 15.3784, <9> 16.2656, <10> 26.4315, <11> 15.7902, <12> 30.2859, <13> 5.709, <14> 27.506, <15> 27.1493, <16> 9.3806, <17> 38.5564, <18> 17.9882, <19> 48.8149, <20> 15.7234;
param workload[JOB] := <1> 41.5282, <2> 12.8507, <3> 38.6284, <4> 0.4531, <5> 33.057, <6> 1.2496, <7> 13.649, <8> 24.9187, <9> 8.7622, <10> 14.2025, <11> 15.7442, <12> 41.9479, <13> 5.7419, <14> 18.5939, <15> 29.4077, <16> 21.3554, <17> 34.7132, <18> 26.4841, <19> 49.9044, <20> 30.1336;
param capacity[MACHINE] := <1> 57.9158, <2> 57.9158, <3> 57.9158, <4> 57.9158, <5> 57.9158, <6> 57.9158;

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
