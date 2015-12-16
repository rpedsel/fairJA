set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.839, <2> 21.8725, <3> 25.488, <4> 28.3527, <5> 24.1675, <6> 23.9946, <7> 19.4295, <8> 19.9578, <9> 28.5293, <10> 24.8601, <11> 31.1464, <12> 25.1063, <13> 31.546, <14> 27.0584, <15> 27.831, <16> 20.881, <17> 25.3298, <18> 25.0624, <19> 22.03, <20> 29.4022;
param workload[JOB] := <1> 30.839, <2> 21.8725, <3> 25.488, <4> 28.3527, <5> 24.1675, <6> 23.9946, <7> 19.4295, <8> 19.9578, <9> 28.5293, <10> 24.8601, <11> 31.1464, <12> 25.1063, <13> 31.546, <14> 27.0584, <15> 27.831, <16> 20.881, <17> 25.3298, <18> 25.0624, <19> 22.03, <20> 29.4022;
param capacity[MACHINE] := <1> 64.1105, <2> 64.1105, <3> 64.1105, <4> 64.1105, <5> 64.1105, <6> 64.1105;

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
