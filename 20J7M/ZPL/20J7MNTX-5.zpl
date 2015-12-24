set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.0741, <2> 26.4551, <3> 18.829, <4> 24.815, <5> 25.9989, <6> 20.4555, <7> 20.3572, <8> 17.3201, <9> 24.9142, <10> 25.7083, <11> 23.2877, <12> 28.8347, <13> 17.9579, <14> 17.7375, <15> 31.4895, <16> 14.4807, <17> 27.1122, <18> 21.3415, <19> 34.6222, <20> 28.8979;
param workload[JOB] := <1> 5.484, <2> 5.1435, <3> 4.3392, <4> 4.9815, <5> 5.0989, <6> 4.5228, <7> 4.5119, <8> 4.1617, <9> 4.9914, <10> 5.0703, <11> 4.8257, <12> 5.3698, <13> 4.2377, <14> 4.2116, <15> 5.6116, <16> 3.8054, <17> 5.2069, <18> 4.6197, <19> 5.8841, <20> 5.3757;
param capacity[MACHINE] := <1> 10.4414, <2> 10.4414, <3> 10.4414, <4> 10.4414, <5> 10.4414, <6> 10.4414, <7> 10.4414;

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
