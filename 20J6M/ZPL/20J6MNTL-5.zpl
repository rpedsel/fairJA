set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.4771, <2> 25.1993, <3> 27.631, <4> 32.641, <5> 20.4252, <6> 17.6587, <7> 23.2714, <8> 29.1278, <9> 20.8032, <10> 25.7894, <11> 21.564, <12> 17.1516, <13> 32.7406, <14> 11.2754, <15> 30.6912, <16> 25.2004, <17> 32.4416, <18> 27.1426, <19> 29.4727, <20> 24.1159;
param workload[JOB] := <1> 25.4771, <2> 25.1993, <3> 27.631, <4> 32.641, <5> 20.4252, <6> 17.6587, <7> 23.2714, <8> 29.1278, <9> 20.8032, <10> 25.7894, <11> 21.564, <12> 17.1516, <13> 32.7406, <14> 11.2754, <15> 30.6912, <16> 25.2004, <17> 32.4416, <18> 27.1426, <19> 29.4727, <20> 24.1159;
param capacity[MACHINE] := <1> 62.4775, <2> 62.4775, <3> 62.4775, <4> 62.4775, <5> 62.4775, <6> 62.4775;

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
