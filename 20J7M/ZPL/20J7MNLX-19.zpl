set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.2962, <2> 30.0917, <3> 17.9184, <4> 26.838, <5> 18.8268, <6> 29.3918, <7> 23.0638, <8> 26.796, <9> 29.2134, <10> 23.6304, <11> 29.5833, <12> 20.8346, <13> 35.0213, <14> 23.5337, <15> 17.686, <16> 26.645, <17> 27.0617, <18> 35.0835, <19> 30.7012, <20> 21.629;
param workload[JOB] := <1> 4.7219, <2> 5.4856, <3> 4.233, <4> 5.1805, <5> 4.339, <6> 5.4214, <7> 4.8025, <8> 5.1765, <9> 5.4049, <10> 4.8611, <11> 5.4391, <12> 4.5645, <13> 5.9179, <14> 4.8512, <15> 4.2055, <16> 5.1619, <17> 5.2021, <18> 5.9231, <19> 5.5409, <20> 4.6507;
param capacity[MACHINE] := <1> 14.4405, <2> 14.4405, <3> 14.4405, <4> 14.4405, <5> 14.4405, <6> 14.4405, <7> 14.4405;

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
