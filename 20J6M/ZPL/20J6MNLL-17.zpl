set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.3636, <2> 28.4049, <3> 25.2206, <4> 14.9665, <5> 17.0063, <6> 27.6985, <7> 24.9276, <8> 26.3023, <9> 27.0984, <10> 21.5165, <11> 25.3784, <12> 32.3102, <13> 23.5667, <14> 19.2888, <15> 27.9047, <16> 21.8535, <17> 21.425, <18> 32.5884, <19> 29.5095, <20> 21.819;
param workload[JOB] := <1> 25.3636, <2> 28.4049, <3> 25.2206, <4> 14.9665, <5> 17.0063, <6> 27.6985, <7> 24.9276, <8> 26.3023, <9> 27.0984, <10> 21.5165, <11> 25.3784, <12> 32.3102, <13> 23.5667, <14> 19.2888, <15> 27.9047, <16> 21.8535, <17> 21.425, <18> 32.5884, <19> 29.5095, <20> 21.819;
param capacity[MACHINE] := <1> 82.3582, <2> 82.3582, <3> 82.3582, <4> 82.3582, <5> 82.3582, <6> 82.3582;

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
