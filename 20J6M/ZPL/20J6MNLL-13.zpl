set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.189, <2> 21.7079, <3> 20.6334, <4> 29.8301, <5> 25.9581, <6> 21.3792, <7> 25.6996, <8> 27.579, <9> 18.8469, <10> 25.6919, <11> 23.3164, <12> 19.2024, <13> 23.3281, <14> 19.9202, <15> 29.8857, <16> 22.0591, <17> 32.473, <18> 28.0711, <19> 27.5755, <20> 16.1483;
param workload[JOB] := <1> 20.189, <2> 21.7079, <3> 20.6334, <4> 29.8301, <5> 25.9581, <6> 21.3792, <7> 25.6996, <8> 27.579, <9> 18.8469, <10> 25.6919, <11> 23.3164, <12> 19.2024, <13> 23.3281, <14> 19.9202, <15> 29.8857, <16> 22.0591, <17> 32.473, <18> 28.0711, <19> 27.5755, <20> 16.1483;
param capacity[MACHINE] := <1> 79.9158, <2> 79.9158, <3> 79.9158, <4> 79.9158, <5> 79.9158, <6> 79.9158;

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
