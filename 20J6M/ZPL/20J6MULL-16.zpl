set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.4875, <2> 19.0653, <3> 4.5845, <4> 19.9965, <5> 20.6573, <6> 17.0217, <7> 24.0061, <8> 6.6992, <9> 22.2907, <10> 0.1482, <11> 7.3551, <12> 34.9158, <13> 36.2187, <14> 17.3297, <15> 6.408, <16> 40.5479, <17> 10.8844, <18> 34.915, <19> 40.3478, <20> 47.3406;
param workload[JOB] := <1> 31.4875, <2> 19.0653, <3> 4.5845, <4> 19.9965, <5> 20.6573, <6> 17.0217, <7> 24.0061, <8> 6.6992, <9> 22.2907, <10> 0.1482, <11> 7.3551, <12> 34.9158, <13> 36.2187, <14> 17.3297, <15> 6.408, <16> 40.5479, <17> 10.8844, <18> 34.915, <19> 40.3478, <20> 47.3406;
param capacity[MACHINE] := <1> 73.7033, <2> 73.7033, <3> 73.7033, <4> 73.7033, <5> 73.7033, <6> 73.7033;

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
