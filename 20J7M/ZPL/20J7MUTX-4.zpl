set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.5951, <2> 7.3396, <3> 24.5113, <4> 30.0365, <5> 21.2858, <6> 37.1372, <7> 11.2703, <8> 0.5181, <9> 31.9204, <10> 7.764, <11> 9.5794, <12> 40.742, <13> 33.6451, <14> 14.9211, <15> 38.352, <16> 9.6482, <17> 28.8284, <18> 21.5377, <19> 15.9055, <20> 25.5002;
param workload[JOB] := <1> 4.4266, <2> 2.7092, <3> 4.9509, <4> 5.4806, <5> 4.6137, <6> 6.094, <7> 3.3571, <8> 0.7198, <9> 5.6498, <10> 2.7864, <11> 3.0951, <12> 6.3829, <13> 5.8004, <14> 3.8628, <15> 6.1929, <16> 3.1062, <17> 5.3692, <18> 4.6409, <19> 3.9882, <20> 5.0498;
param capacity[MACHINE] := <1> 9.4582, <2> 9.4582, <3> 9.4582, <4> 9.4582, <5> 9.4582, <6> 9.4582, <7> 9.4582;

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
