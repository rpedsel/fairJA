set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.1031, <2> 26.6173, <3> 29.4389, <4> 25.7996, <5> 23.264, <6> 24.28, <7> 32.2621, <8> 36.9489, <9> 24.9809, <10> 37.952, <11> 24.8978, <12> 29.5328, <13> 14.8957, <14> 27.1319, <15> 21.8139, <16> 17.0196, <17> 29.928, <18> 36.2107, <19> 20.6054, <20> 32.5691;
param workload[JOB] := <1> 24.1031, <2> 26.6173, <3> 29.4389, <4> 25.7996, <5> 23.264, <6> 24.28, <7> 32.2621, <8> 36.9489, <9> 24.9809, <10> 37.952, <11> 24.8978, <12> 29.5328, <13> 14.8957, <14> 27.1319, <15> 21.8139, <16> 17.0196, <17> 29.928, <18> 36.2107, <19> 20.6054, <20> 32.5691;
param capacity[MACHINE] := <1> 57.8841, <2> 57.8841, <3> 57.8841, <4> 57.8841, <5> 57.8841, <6> 57.8841, <7> 57.8841;

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
