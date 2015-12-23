set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 44.5187, <2> 1.0451, <3> 27.0239, <4> 9.7867, <5> 40.765, <6> 10.9074, <7> 0.8962, <8> 20.8683, <9> 45.4482, <10> 37.8518, <11> 36.0926, <12> 9.5434, <13> 6.2248, <14> 23.5892, <15> 7.9637, <16> 13.3703, <17> 17.9214, <18> 40.9427, <19> 9.4234, <20> 14.4813;
param workload[JOB] := <1> 44.5187, <2> 1.0451, <3> 27.0239, <4> 9.7867, <5> 40.765, <6> 10.9074, <7> 0.8962, <8> 20.8683, <9> 45.4482, <10> 37.8518, <11> 36.0926, <12> 9.5434, <13> 6.2248, <14> 23.5892, <15> 7.9637, <16> 13.3703, <17> 17.9214, <18> 40.9427, <19> 9.4234, <20> 14.4813;
param capacity[MACHINE] := <1> 418.6641, <2> 418.6641, <3> 418.6641, <4> 418.6641, <5> 418.6641, <6> 418.6641, <7> 418.6641;

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