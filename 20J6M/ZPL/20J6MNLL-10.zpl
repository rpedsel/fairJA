set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.3062, <2> 30.7614, <3> 29.0325, <4> 28.2056, <5> 24.7534, <6> 23.5727, <7> 17.5658, <8> 19.8536, <9> 26.2944, <10> 30.3239, <11> 20.0777, <12> 27.842, <13> 29.6062, <14> 26.7496, <15> 24.8965, <16> 30.3891, <17> 20.9957, <18> 14.3037, <19> 29.9882, <20> 25.874;
param workload[JOB] := <1> 21.3062, <2> 30.7614, <3> 29.0325, <4> 28.2056, <5> 24.7534, <6> 23.5727, <7> 17.5658, <8> 19.8536, <9> 26.2944, <10> 30.3239, <11> 20.0777, <12> 27.842, <13> 29.6062, <14> 26.7496, <15> 24.8965, <16> 30.3891, <17> 20.9957, <18> 14.3037, <19> 29.9882, <20> 25.874;
param capacity[MACHINE] := <1> 83.732, <2> 83.732, <3> 83.732, <4> 83.732, <5> 83.732, <6> 83.732;

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
