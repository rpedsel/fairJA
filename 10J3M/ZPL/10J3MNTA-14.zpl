set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.1155, <2> 22.5347, <3> 22.6457, <4> 28.4691, <5> 27.3847, <6> 28.7759, <7> 22.7893, <8> 26.4102, <9> 22.016, <10> 23.6732;
param workload[JOB] := <1> 102.3233, <2> 507.8127, <3> 512.8277, <4> 810.4897, <5> 749.9218, <6> 828.0524, <7> 519.3522, <8> 697.4987, <9> 484.7043, <10> 560.4204;
param capacity[MACHINE] := <1> 1443.3508, <2> 1443.3508, <3> 1443.3508;

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
