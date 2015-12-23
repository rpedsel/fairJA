set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 36.9429, <2> 27.1862, <3> 34.5553, <4> 24.2855, <5> 36.7195, <6> 10.5516, <7> 23.0596, <8> 23.5941, <9> 31.8221, <10> 21.6695, <11> 40.6314, <12> 44.4434, <13> 4.6052, <14> 49.5881, <15> 4.2855, <16> 26.1623, <17> 1.9892, <18> 22.8935, <19> 34.7955, <20> 9.0262;
param workload[JOB] := <1> 36.9429, <2> 27.1862, <3> 34.5553, <4> 24.2855, <5> 36.7195, <6> 10.5516, <7> 23.0596, <8> 23.5941, <9> 31.8221, <10> 21.6695, <11> 40.6314, <12> 44.4434, <13> 4.6052, <14> 49.5881, <15> 4.2855, <16> 26.1623, <17> 1.9892, <18> 22.8935, <19> 34.7955, <20> 9.0262;
param capacity[MACHINE] := <1> 54.515, <2> 54.515, <3> 54.515, <4> 54.515, <5> 54.515, <6> 54.515, <7> 54.515;

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
