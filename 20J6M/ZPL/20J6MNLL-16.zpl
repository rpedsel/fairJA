set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.2931, <2> 24.4495, <3> 29.7197, <4> 29.5469, <5> 25.7613, <6> 27.4941, <7> 20.9964, <8> 29.9948, <9> 22.9667, <10> 23.0527, <11> 19.8791, <12> 24.9745, <13> 22.1677, <14> 27.1939, <15> 24.4967, <16> 20.8655, <17> 24.394, <18> 26.5256, <19> 36.0211, <20> 34.8593;
param workload[JOB] := <1> 31.2931, <2> 24.4495, <3> 29.7197, <4> 29.5469, <5> 25.7613, <6> 27.4941, <7> 20.9964, <8> 29.9948, <9> 22.9667, <10> 23.0527, <11> 19.8791, <12> 24.9745, <13> 22.1677, <14> 27.1939, <15> 24.4967, <16> 20.8655, <17> 24.394, <18> 26.5256, <19> 36.0211, <20> 34.8593;
param capacity[MACHINE] := <1> 87.7754, <2> 87.7754, <3> 87.7754, <4> 87.7754, <5> 87.7754, <6> 87.7754;

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
