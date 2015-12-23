set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 2.2188, <2> 44.4775, <3> 39.2533, <4> 2.9229, <5> 3.7918, <6> 46.4863, <7> 49.0006, <8> 48.797, <9> 24.1665, <10> 12.7386, <11> 27.3274, <12> 28.6123, <13> 37.6571, <14> 18.8854, <15> 48.9251, <16> 3.8188, <17> 35.8141, <18> 30.2637, <19> 5.0778, <20> 15.9762;
param workload[JOB] := <1> 2.2188, <2> 44.4775, <3> 39.2533, <4> 2.9229, <5> 3.7918, <6> 46.4863, <7> 49.0006, <8> 48.797, <9> 24.1665, <10> 12.7386, <11> 27.3274, <12> 28.6123, <13> 37.6571, <14> 18.8854, <15> 48.9251, <16> 3.8188, <17> 35.8141, <18> 30.2637, <19> 5.0778, <20> 15.9762;
param capacity[MACHINE] := <1> 75.173, <2> 75.173, <3> 75.173, <4> 75.173, <5> 75.173, <6> 75.173, <7> 75.173;

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
