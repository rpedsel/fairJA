set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.2412, <2> 26.4595, <3> 29.5853, <4> 31.6727, <5> 23.6573, <6> 31.9316, <7> 20.5639, <8> 28.5721, <9> 26.4473, <10> 27.1603, <11> 21.5292, <12> 27.8369, <13> 28.1608, <14> 24.93, <15> 23.981, <16> 29.2952, <17> 31.9138, <18> 33.6453, <19> 14.8062, <20> 27.2352;
param workload[JOB] := <1> 29.2412, <2> 26.4595, <3> 29.5853, <4> 31.6727, <5> 23.6573, <6> 31.9316, <7> 20.5639, <8> 28.5721, <9> 26.4473, <10> 27.1603, <11> 21.5292, <12> 27.8369, <13> 28.1608, <14> 24.93, <15> 23.981, <16> 29.2952, <17> 31.9138, <18> 33.6453, <19> 14.8062, <20> 27.2352;
param capacity[MACHINE] := <1> 538.6248, <2> 538.6248, <3> 538.6248, <4> 538.6248, <5> 538.6248, <6> 538.6248, <7> 538.6248;

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
