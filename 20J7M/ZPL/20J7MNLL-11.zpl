set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.3763, <2> 26.7123, <3> 31.2086, <4> 26.1405, <5> 18.7191, <6> 25.9961, <7> 17.5784, <8> 27.4543, <9> 19.321, <10> 22.0456, <11> 28.6168, <12> 18.4851, <13> 27.6785, <14> 20.4312, <15> 25.0069, <16> 31.6179, <17> 24.2765, <18> 26.1026, <19> 31.7245, <20> 29.3847;
param workload[JOB] := <1> 23.3763, <2> 26.7123, <3> 31.2086, <4> 26.1405, <5> 18.7191, <6> 25.9961, <7> 17.5784, <8> 27.4543, <9> 19.321, <10> 22.0456, <11> 28.6168, <12> 18.4851, <13> 27.6785, <14> 20.4312, <15> 25.0069, <16> 31.6179, <17> 24.2765, <18> 26.1026, <19> 31.7245, <20> 29.3847;
param capacity[MACHINE] := <1> 71.6967, <2> 71.6967, <3> 71.6967, <4> 71.6967, <5> 71.6967, <6> 71.6967, <7> 71.6967;

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
