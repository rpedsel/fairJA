set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.084, <2> 22.6111, <3> 18.9251, <4> 22.7686, <5> 23.012, <6> 20.3372, <7> 21.4051, <8> 27.1631, <9> 23.8038, <10> 32.7583, <11> 25.737, <12> 27.59, <13> 19.3176, <14> 28.2462, <15> 26.0411, <16> 18.1436, <17> 26.9612, <18> 29.4153, <19> 24.1799, <20> 23.6447;
param workload[JOB] := <1> 20.084, <2> 22.6111, <3> 18.9251, <4> 22.7686, <5> 23.012, <6> 20.3372, <7> 21.4051, <8> 27.1631, <9> 23.8038, <10> 32.7583, <11> 25.737, <12> 27.59, <13> 19.3176, <14> 28.2462, <15> 26.0411, <16> 18.1436, <17> 26.9612, <18> 29.4153, <19> 24.1799, <20> 23.6447;
param capacity[MACHINE] := <1> 80.3575, <2> 80.3575, <3> 80.3575, <4> 80.3575, <5> 80.3575, <6> 80.3575;

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
