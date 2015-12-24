set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 7.5625, <2> 25.4987, <3> 48.8022, <4> 45.0857, <5> 4.9296, <6> 25.8618, <7> 11.9458, <8> 45.8974, <9> 33.4224, <10> 22.6522, <11> 9.2915, <12> 26.1608, <13> 44.3589, <14> 34.7401, <15> 12.2677, <16> 6.0952, <17> 2.87, <18> 14.8654, <19> 30.5464, <20> 7.375;
param workload[JOB] := <1> 20.5343, <2> 13.7457, <3> 40.3438, <4> 38.9742, <5> 27.0405, <6> 49.4014, <7> 16.646, <8> 27.4283, <9> 34.9982, <10> 6.8779, <11> 47.3481, <12> 20.9742, <13> 6.648, <14> 12.5216, <15> 12.6496, <16> 5.9331, <17> 18.9389, <18> 7.9317, <19> 35.5413, <20> 21.6172;
param capacity[MACHINE] := <1> 49.9387, <2> 49.9387, <3> 49.9387, <4> 49.9387, <5> 49.9387, <6> 49.9387, <7> 49.9387;

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
