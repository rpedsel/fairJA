set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.8641, <2> 29.7689, <3> 23.9584, <4> 25.3341, <5> 24.221, <6> 25.4181, <7> 19.5529, <8> 21.1422, <9> 21.4819, <10> 21.757, <11> 33.4171, <12> 13.824, <13> 22.1314, <14> 21.9014, <15> 25.6808, <16> 20.6533, <17> 22.258, <18> 20.5566, <19> 28.5584, <20> 23.5089;
param workload[JOB] := <1> 28.8641, <2> 29.7689, <3> 23.9584, <4> 25.3341, <5> 24.221, <6> 25.4181, <7> 19.5529, <8> 21.1422, <9> 21.4819, <10> 21.757, <11> 33.4171, <12> 13.824, <13> 22.1314, <14> 21.9014, <15> 25.6808, <16> 20.6533, <17> 22.258, <18> 20.5566, <19> 28.5584, <20> 23.5089;
param capacity[MACHINE] := <1> 473.9885, <2> 473.9885, <3> 473.9885, <4> 473.9885, <5> 473.9885, <6> 473.9885;

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
