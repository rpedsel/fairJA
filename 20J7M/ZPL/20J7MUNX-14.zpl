set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 46.0035, <2> 22.3011, <3> 19.0246, <4> 18.8124, <5> 32.8839, <6> 8.1182, <7> 46.9844, <8> 5.3014, <9> 47.1147, <10> 15.0645, <11> 28.2262, <12> 0.6741, <13> 15.4586, <14> 48.6876, <15> 4.53, <16> 21.7225, <17> 1.1285, <18> 37.1635, <19> 1.2155, <20> 36.0489;
param workload[JOB] := <1> 6.7826, <2> 4.7224, <3> 4.3617, <4> 4.3373, <5> 5.7344, <6> 2.8492, <7> 6.8545, <8> 2.3025, <9> 6.864, <10> 3.8813, <11> 5.3128, <12> 0.821, <13> 3.9317, <14> 6.9777, <15> 2.1284, <16> 4.6607, <17> 1.0623, <18> 6.0962, <19> 1.1025, <20> 6.0041;
param capacity[MACHINE] := <1> 86.7873, <2> 86.7873, <3> 86.7873, <4> 86.7873, <5> 86.7873, <6> 86.7873, <7> 86.7873;

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
