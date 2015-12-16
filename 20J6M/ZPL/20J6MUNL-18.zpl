set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.3488, <2> 23.112, <3> 42.1406, <4> 32.9445, <5> 21.5257, <6> 2.6567, <7> 45.6246, <8> 22.9312, <9> 11.8751, <10> 9.1689, <11> 37.9783, <12> 11.6102, <13> 43.7512, <14> 26.5233, <15> 38.1695, <16> 27.4307, <17> 0.5208, <18> 1.6406, <19> 11.1627, <20> 40.4268;
param workload[JOB] := <1> 26.3488, <2> 23.112, <3> 42.1406, <4> 32.9445, <5> 21.5257, <6> 2.6567, <7> 45.6246, <8> 22.9312, <9> 11.8751, <10> 9.1689, <11> 37.9783, <12> 11.6102, <13> 43.7512, <14> 26.5233, <15> 38.1695, <16> 27.4307, <17> 0.5208, <18> 1.6406, <19> 11.1627, <20> 40.4268;
param capacity[MACHINE] := <1> 477.5422, <2> 477.5422, <3> 477.5422, <4> 477.5422, <5> 477.5422, <6> 477.5422;

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
