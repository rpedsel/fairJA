set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.0253, <2> 17.4751, <3> 10.5168, <4> 22.4025, <5> 30.7742, <6> 30.3902, <7> 46.8094, <8> 10.606, <9> 22.8396, <10> 16.3208, <11> 12.4805, <12> 24.2431, <13> 20.6461, <14> 12.3332, <15> 2.4867, <16> 20.3675, <17> 48.3081, <18> 1.223, <19> 25.6895, <20> 3.4504;
param workload[JOB] := <1> 15.6844, <2> 7.8212, <3> 0.4504, <4> 41.7035, <5> 40.046, <6> 2.4531, <7> 27.7686, <8> 40.9142, <9> 33.5957, <10> 16.7282, <11> 25.7203, <12> 7.3639, <13> 39.6759, <14> 46.9917, <15> 26.1371, <16> 13.837, <17> 12.4219, <18> 17.4225, <19> 30.5564, <20> 15.6623;
param capacity[MACHINE] := <1> 462.9543, <2> 462.9543, <3> 462.9543, <4> 462.9543, <5> 462.9543, <6> 462.9543;

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
