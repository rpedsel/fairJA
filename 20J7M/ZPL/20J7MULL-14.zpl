set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 45.746, <2> 44.4379, <3> 7.4153, <4> 22.2154, <5> 19.2493, <6> 27.5691, <7> 37.9384, <8> 17.4604, <9> 23.9144, <10> 35.3525, <11> 20.1787, <12> 4.5952, <13> 29.7108, <14> 42.8481, <15> 36.755, <16> 26.4365, <17> 34.8528, <18> 32.4503, <19> 8.5242, <20> 46.4188;
param workload[JOB] := <1> 45.746, <2> 44.4379, <3> 7.4153, <4> 22.2154, <5> 19.2493, <6> 27.5691, <7> 37.9384, <8> 17.4604, <9> 23.9144, <10> 35.3525, <11> 20.1787, <12> 4.5952, <13> 29.7108, <14> 42.8481, <15> 36.755, <16> 26.4365, <17> 34.8528, <18> 32.4503, <19> 8.5242, <20> 46.4188;
param capacity[MACHINE] := <1> 80.5813, <2> 80.5813, <3> 80.5813, <4> 80.5813, <5> 80.5813, <6> 80.5813, <7> 80.5813;

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
