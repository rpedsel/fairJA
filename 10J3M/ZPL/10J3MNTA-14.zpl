set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.2954, <2> 20.1289, <3> 24.8514, <4> 25.8227, <5> 22.3166, <6> 21.5874, <7> 22.6367, <8> 24.2011, <9> 20.6741, <10> 22.0111;
param workload[JOB] := <1> 639.8573, <2> 405.1726, <3> 617.5921, <4> 666.8118, <5> 498.0306, <6> 466.0158, <7> 512.4202, <8> 585.6932, <9> 427.4184, <10> 484.4885;
param capacity[MACHINE] := <1> 1325.8751, <2> 1325.8751, <3> 1325.8751;

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
