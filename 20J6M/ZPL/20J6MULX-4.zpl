set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 3.7198, <2> 10.6441, <3> 22.0395, <4> 45.1318, <5> 43.1224, <6> 39.0894, <7> 34.276, <8> 4.1113, <9> 48.4148, <10> 0.7702, <11> 48.0054, <12> 23.8329, <13> 40.7561, <14> 31.9645, <15> 48.8179, <16> 32.0454, <17> 33.6432, <18> 49.1047, <19> 40.46, <20> 10.8277;
param workload[JOB] := <1> 1.9287, <2> 3.2625, <3> 4.6946, <4> 6.718, <5> 6.5668, <6> 6.2522, <7> 5.8546, <8> 2.0276, <9> 6.9581, <10> 0.8776, <11> 6.9286, <12> 4.8819, <13> 6.3841, <14> 5.6537, <15> 6.987, <16> 5.6609, <17> 5.8003, <18> 7.0075, <19> 6.3608, <20> 3.2905;
param capacity[MACHINE] := <1> 17.3493, <2> 17.3493, <3> 17.3493, <4> 17.3493, <5> 17.3493, <6> 17.3493;

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
