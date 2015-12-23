set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 40.1487, <2> 33.2708, <3> 34.5858, <4> 47.2234, <5> 48.9888, <6> 23.9272, <7> 25.367, <8> 12.5803, <9> 40.9002, <10> 3.6639, <11> 37.856, <12> 4.5735, <13> 36.7776, <14> 26.8913, <15> 0.429, <16> 46.3816, <17> 40.6551, <18> 1.984, <19> 15.2042, <20> 44.7416;
param workload[JOB] := <1> 2.2209, <2> 8.0682, <3> 6.0793, <4> 44.3975, <5> 4.6171, <6> 40.7148, <7> 30.4732, <8> 42.5847, <9> 31.866, <10> 48.276, <11> 39.0739, <12> 12.0918, <13> 45.437, <14> 47.7374, <15> 8.6305, <16> 31.7307, <17> 36.9711, <18> 25.6061, <19> 37.7507, <20> 46.6883;
param capacity[MACHINE] := <1> 63.323, <2> 63.323, <3> 63.323, <4> 63.323, <5> 63.323, <6> 63.323, <7> 63.323;

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
