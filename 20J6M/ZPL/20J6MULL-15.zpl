set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.1369, <2> 3.248, <3> 6.3042, <4> 5.5099, <5> 17.4781, <6> 32.1681, <7> 0.0177, <8> 24.7582, <9> 7.1576, <10> 8.3796, <11> 1.0305, <12> 11.1828, <13> 1.4137, <14> 3.0379, <15> 35.9787, <16> 46.7253, <17> 3.7883, <18> 9.2226, <19> 12.0213, <20> 35.5791;
param workload[JOB] := <1> 32.1369, <2> 3.248, <3> 6.3042, <4> 5.5099, <5> 17.4781, <6> 32.1681, <7> 0.0177, <8> 24.7582, <9> 7.1576, <10> 8.3796, <11> 1.0305, <12> 11.1828, <13> 1.4137, <14> 3.0379, <15> 35.9787, <16> 46.7253, <17> 3.7883, <18> 9.2226, <19> 12.0213, <20> 35.5791;
param capacity[MACHINE] := <1> 49.5231, <2> 49.5231, <3> 49.5231, <4> 49.5231, <5> 49.5231, <6> 49.5231;

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
