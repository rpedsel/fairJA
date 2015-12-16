set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.0835, <2> 21.2753, <3> 22.5979, <4> 25.1536, <5> 18.2395, <6> 27.612, <7> 25.3464, <8> 32.2321, <9> 30.5079, <10> 28.5042, <11> 15.4719, <12> 21.9636, <13> 23.3971, <14> 17.1169, <15> 24.5987, <16> 21.5478, <17> 29.1659, <18> 24.9561, <19> 10.6536, <20> 21.14;
param workload[JOB] := <1> 16.0835, <2> 21.2753, <3> 22.5979, <4> 25.1536, <5> 18.2395, <6> 27.612, <7> 25.3464, <8> 32.2321, <9> 30.5079, <10> 28.5042, <11> 15.4719, <12> 21.9636, <13> 23.3971, <14> 17.1169, <15> 24.5987, <16> 21.5478, <17> 29.1659, <18> 24.9561, <19> 10.6536, <20> 21.14;
param capacity[MACHINE] := <1> 76.2607, <2> 76.2607, <3> 76.2607, <4> 76.2607, <5> 76.2607, <6> 76.2607;

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
