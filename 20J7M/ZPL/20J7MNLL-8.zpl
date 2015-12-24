set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.3043, <2> 31.2713, <3> 20.5235, <4> 27.486, <5> 24.2108, <6> 21.9277, <7> 27.1665, <8> 26.9177, <9> 20.3378, <10> 26.5306, <11> 28.667, <12> 29.1947, <13> 27.7957, <14> 25.0024, <15> 24.5821, <16> 20.1139, <17> 25.852, <18> 23.4394, <19> 26.4, <20> 22.5638;
param workload[JOB] := <1> 21.3043, <2> 31.2713, <3> 20.5235, <4> 27.486, <5> 24.2108, <6> 21.9277, <7> 27.1665, <8> 26.9177, <9> 20.3378, <10> 26.5306, <11> 28.667, <12> 29.1947, <13> 27.7957, <14> 25.0024, <15> 24.5821, <16> 20.1139, <17> 25.852, <18> 23.4394, <19> 26.4, <20> 22.5638;
param capacity[MACHINE] := <1> 71.6125, <2> 71.6125, <3> 71.6125, <4> 71.6125, <5> 71.6125, <6> 71.6125, <7> 71.6125;

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
