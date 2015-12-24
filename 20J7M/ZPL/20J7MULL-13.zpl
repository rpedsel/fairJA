set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.6354, <2> 37.2715, <3> 8.017, <4> 48.0943, <5> 38.8422, <6> 25.0917, <7> 13.903, <8> 0.026, <9> 15.9245, <10> 6.0581, <11> 39.124, <12> 1.1555, <13> 1.1532, <14> 49.9478, <15> 13.9689, <16> 15.5404, <17> 18.0828, <18> 45.389, <19> 28.2416, <20> 45.5222;
param workload[JOB] := <1> 23.6354, <2> 37.2715, <3> 8.017, <4> 48.0943, <5> 38.8422, <6> 25.0917, <7> 13.903, <8> 0.026, <9> 15.9245, <10> 6.0581, <11> 39.124, <12> 1.1555, <13> 1.1532, <14> 49.9478, <15> 13.9689, <16> 15.5404, <17> 18.0828, <18> 45.389, <19> 28.2416, <20> 45.5222;
param capacity[MACHINE] := <1> 67.8556, <2> 67.8556, <3> 67.8556, <4> 67.8556, <5> 67.8556, <6> 67.8556, <7> 67.8556;

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
