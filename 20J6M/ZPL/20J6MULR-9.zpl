set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.3675, <2> 4.395, <3> 26.2832, <4> 11.7189, <5> 9.5002, <6> 2.8781, <7> 26.9355, <8> 5.8254, <9> 8.3571, <10> 27.666, <11> 33.417, <12> 5.1151, <13> 23.3788, <14> 39.672, <15> 39.7774, <16> 31.3801, <17> 47.8683, <18> 7.2307, <19> 13.8209, <20> 39.0458;
param workload[JOB] := <1> 13.1238, <2> 31.5449, <3> 24.1065, <4> 25.9988, <5> 47.9732, <6> 32.1557, <7> 9.4437, <8> 7.3738, <9> 12.3391, <10> 42.0186, <11> 19.9069, <12> 1.481, <13> 32.5247, <14> 37.5812, <15> 21.5449, <16> 37.9994, <17> 39.2144, <18> 47.1817, <19> 0.1672, <20> 20.0553;
param capacity[MACHINE] := <1> 83.9558, <2> 83.9558, <3> 83.9558, <4> 83.9558, <5> 83.9558, <6> 83.9558;

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
