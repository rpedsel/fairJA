set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.4773, <2> 31.1867, <3> 20.8375, <4> 12.9244, <5> 30.4807, <6> 20.5834, <7> 15.7691, <8> 28.1291, <9> 23.5678, <10> 23.6388, <11> 25.9241, <12> 29.4954, <13> 30.1528, <14> 33.9024, <15> 18.538, <16> 25.6065, <17> 22.9781, <18> 26.412, <19> 16.7136, <20> 14.9805;
param workload[JOB] := <1> 4.6344, <2> 5.5845, <3> 4.5648, <4> 3.5951, <5> 5.5209, <6> 4.5369, <7> 3.971, <8> 5.3037, <9> 4.8547, <10> 4.862, <11> 5.0916, <12> 5.431, <13> 5.4912, <14> 5.8226, <15> 4.3056, <16> 5.0603, <17> 4.7935, <18> 5.1393, <19> 4.0882, <20> 3.8705;
param capacity[MACHINE] := <1> 16.087, <2> 16.087, <3> 16.087, <4> 16.087, <5> 16.087, <6> 16.087;

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
