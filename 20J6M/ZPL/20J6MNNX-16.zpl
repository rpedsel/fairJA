set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.5636, <2> 23.4329, <3> 35.6234, <4> 30.4369, <5> 31.7994, <6> 18.7579, <7> 25.5671, <8> 29.1402, <9> 25.5025, <10> 24.2382, <11> 19.4809, <12> 20.926, <13> 24.7283, <14> 23.3864, <15> 24.4131, <16> 16.4385, <17> 22.2569, <18> 32.284, <19> 27.0913, <20> 27.4686;
param workload[JOB] := <1> 4.8542, <2> 4.8408, <3> 5.9685, <4> 5.517, <5> 5.6391, <6> 4.331, <7> 5.0564, <8> 5.3982, <9> 5.05, <10> 4.9232, <11> 4.4137, <12> 4.5745, <13> 4.9728, <14> 4.8359, <15> 4.941, <16> 4.0544, <17> 4.7177, <18> 5.6819, <19> 5.2049, <20> 5.241;
param capacity[MACHINE] := <1> 100.2162, <2> 100.2162, <3> 100.2162, <4> 100.2162, <5> 100.2162, <6> 100.2162;

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
