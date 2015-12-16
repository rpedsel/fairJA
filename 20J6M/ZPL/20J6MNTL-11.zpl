set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.5969, <2> 24.9966, <3> 32.6004, <4> 20.3429, <5> 29.135, <6> 28.8531, <7> 24.7553, <8> 29.9871, <9> 22.5823, <10> 31.9709, <11> 15.8976, <12> 26.4113, <13> 20.5455, <14> 21.6724, <15> 24.5836, <16> 26.3102, <17> 28.1814, <18> 20.4947, <19> 24.0717, <20> 24.8668;
param workload[JOB] := <1> 24.5969, <2> 24.9966, <3> 32.6004, <4> 20.3429, <5> 29.135, <6> 28.8531, <7> 24.7553, <8> 29.9871, <9> 22.5823, <10> 31.9709, <11> 15.8976, <12> 26.4113, <13> 20.5455, <14> 21.6724, <15> 24.5836, <16> 26.3102, <17> 28.1814, <18> 20.4947, <19> 24.0717, <20> 24.8668;
param capacity[MACHINE] := <1> 62.857, <2> 62.857, <3> 62.857, <4> 62.857, <5> 62.857, <6> 62.857;

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
