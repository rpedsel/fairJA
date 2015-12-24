set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.4262, <2> 23.463, <3> 25.3671, <4> 29.5573, <5> 30.3446, <6> 26.9479, <7> 22.4914, <8> 31.1402, <9> 22.5842, <10> 26.4193, <11> 14.8253, <12> 18.3287, <13> 37.9983, <14> 25.0661, <15> 35.6277, <16> 25.9008, <17> 24.2051, <18> 27.2697, <19> 21.5412, <20> 31.03;
param workload[JOB] := <1> 19.4262, <2> 23.463, <3> 25.3671, <4> 29.5573, <5> 30.3446, <6> 26.9479, <7> 22.4914, <8> 31.1402, <9> 22.5842, <10> 26.4193, <11> 14.8253, <12> 18.3287, <13> 37.9983, <14> 25.0661, <15> 35.6277, <16> 25.9008, <17> 24.2051, <18> 27.2697, <19> 21.5412, <20> 31.03;
param capacity[MACHINE] := <1> 519.5341, <2> 519.5341, <3> 519.5341, <4> 519.5341, <5> 519.5341, <6> 519.5341, <7> 519.5341;

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
