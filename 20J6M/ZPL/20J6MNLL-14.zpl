set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 12.1431, <2> 21.642, <3> 35.1087, <4> 16.3572, <5> 31.0628, <6> 18.9022, <7> 24.8573, <8> 24.0505, <9> 28.5217, <10> 21.7211, <11> 31.2838, <12> 22.5488, <13> 23.8405, <14> 12.2451, <15> 24.8879, <16> 24.6968, <17> 30.6784, <18> 21.6262, <19> 33.7697, <20> 28.803;
param workload[JOB] := <1> 12.1431, <2> 21.642, <3> 35.1087, <4> 16.3572, <5> 31.0628, <6> 18.9022, <7> 24.8573, <8> 24.0505, <9> 28.5217, <10> 21.7211, <11> 31.2838, <12> 22.5488, <13> 23.8405, <14> 12.2451, <15> 24.8879, <16> 24.6968, <17> 30.6784, <18> 21.6262, <19> 33.7697, <20> 28.803;
param capacity[MACHINE] := <1> 81.4578, <2> 81.4578, <3> 81.4578, <4> 81.4578, <5> 81.4578, <6> 81.4578;

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
